#!/bin/bash

# Script to edit an existing rclone Google Drive remote with specific answers

# Check if rclone is installed
if ! command -v rclone &> /dev/null; then
  echo "rclone is not installed. Please install it first."
  echo "For Manjaro, you can use: 'sudo pacman -S rclone'"
  exit 1
fi

echo "Starting rclone configuration to edit an existing Google Drive remote..."

# Define the remote name (assuming it's 'gdrive', change if needed)
remote_name="gdrive"

# The config token value (replace with your actual token)
config_token='{"access_token":"ya29.a0AW4XtxjJUYykzSNFlZ-Z1k1K2b6TLh0qxNDGEjbgCNZJxfY4LRqoY_zcXv583hM6HEhCtbkR-rDTF6o06zIBxTVnnJhvKEyVYk8eY-EWFJYH9JmbK6It2y-inajvr2KhgFASRYY7XekWPNpTVxwoWfIU-bDJfOEVrSlydYfJaCgYKAQcSARMSFQHGX2MiJOCoCx7iiaTvl3oYYXBFnA0175","token_type":"Bearer","refresh_token":"1//0g0uhkKp9Q_J5CgYIARAAGBASNwF-L9IrZxMNsPd2qq67pnv2W5MFo1B7u4uQUsPmlOh44bAGZHeYOFvYIJOcXtLWXY9FN_HcML8","expiry":"2025-05-27T12:49:02.9722649+05:30"}"

# Check if the remote exists (optional, but good practice)
if rclone config show "$remote_name" &> /dev/null; then
  echo "Attempting to edit existing remote: '$remote_name'"

  # Pipe the answers to rclone config
  echo -e "e\n${remote_name}\n1\n\n\n1\n\nn\nn\n${config_token}\nn\ny\n" | rclone config

  echo ""
  echo "Rclone configuration for remote '$remote_name' has been attempted with the provided values."
  echo "Please run 'rclone config show \"$remote_name\"' to verify the configuration."
  echo "You might need to adjust the 'config_token' variable in this script with your actual token."
  echo ""
else
  echo "Error: Remote '$remote_name' does not exist. Please create it first using 'rclone config'."
  exit 1
fi

exit 0
