NAME=entrykit
ARCH=$(shell uname -m)
ORG=progrium
VERSION=0.3.0

.PHONY: build release

build:
	glu build darwin,linux ./cmd

deps:
	go get github.com/gliderlabs/glu
	go get -d ./cmd

test-race:
	go build -race -o ./build/entrykit ./cmd/
	cd build/ && ln -s ./entrykit ./codep || true && cd ..
	./build/codep a="echo a" b="echo b"
	
release:
	glu release v$(VERSION)
