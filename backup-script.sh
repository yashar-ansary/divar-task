#!/bin/bash

source $(pwd)/backup.config

CURRENT_DATE=$(date +"%Y%m%d%H%M")
FILE_NAME="$CURRENT_DATE.tar"


if [ "$COMPRESS" = "true" ]; then
    FILE_NAME+=".gz"
    tar -czf "$DST/$FILE_NAME" -C "$SRC" .
else
    tar -cf "$DST/$FILE_NAME" -C "$SRC" .
fi



find "$DST" -name "backup_*.tar*" -type f -mtime +$DATE_INTERVAL -exec rm {} \;


