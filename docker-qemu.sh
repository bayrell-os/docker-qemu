#!/bin/bash

if [ ! -f ./tmp/qemu-user-static.tar ]; then
	
	mkdir tmp
	docker pull multiarch/qemu-user-static:latest
	docker image save multiarch/qemu-user-static:latest > ./tmp/qemu-user-static.tar
	
fi

docker load -i ./tmp/qemu-user-static.tar
docker run --rm --privileged multiarch/qemu-user-static --reset -p yes
