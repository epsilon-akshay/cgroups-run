UUID=$(uuidgen)
cgcreate -g cpu,memory:$UUID
cgset -r memory.limit_in_bytes=100000000 $UUID
cgset -r cpu.shares=512 $UUID

cgexec -g cpu,memory:$UUID
unshare -uinpUrf --mount-proc sh -c "/bin/hostname $UUID && chroot $ROOTFS /bin/sh"