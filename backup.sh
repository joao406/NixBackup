#!/usr/bin/env bash

## Verifications
[[ $(type -P tar) ]] || { echo "Install tar to continue."; exit 1 ;}

case "$1" in
	-b|--backup)
		if [[ -z "$2" || -z "$3" ]]; then
			echo "Error: Please provide a name for the compressed file and a file or folder to compress."
			exit 1
		fi
		current_datetime=$(date +"%Y%m%d_%H%M%S")
		compressed_file_name="backup_$current_datetime.tar"
		echo "[*] Starting..."
		tar -cvf "$compressed_file_name" "$3"
		echo "[+] Saved on $compressed_file_name"
		;;
	-h|--help)
		echo \
		"AVAIBLE OPTIONS:
	-b/--backup compressed_file_name.tar file_or_folder_to_compress"
		;;
	*)
		echo "Type -h/--help to see the help screen."
		exit 1
		;;
esac
