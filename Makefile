.PHONY: all debug debug release run test

all: build/libunicornafl

build:
	mkdir build

unicorn/build/libunicorn-common.a:
	git submodule update --init --recursive
	mkdir unicorn/build
	cd ./unicorn/build && cmake ..
	$(MAKE) -C ./unicorn/build -j8

build/libunicornafl: build unicorn/build/libunicorn-common.a
	cd ./build && cmake ..
	$(MAKE) -C ./build -j8

format:
	format.sh

clean:
	rm -rf build
	rm -rf ./unicorn/build
