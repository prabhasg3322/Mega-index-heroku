#!/bin/bash
curl "https://pastebin.com/raw/bjzadHka" >status
xargs <status curl
cat status | grep 'working\|maintenance'
rclone version
rclone config create 'CLOUDNAME' 'mega' 'user' $UserName 'pass' $PassWord
rclone version
rclone serve webdav CLOUDNAME: --addr :$PORT --buffer-size 256M --dir-cache-time 12h --vfs-read-chunk-size 256M --vfs-read-chunk-size-limit 2G --vfs-cache-mode writes --user $UserName --pass $PassWord 
