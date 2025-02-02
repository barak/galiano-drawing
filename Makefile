CXXFLAGS += -std=c++11
CXXFLAGS += -O3
CXXFLAGS += -Wall

all: drawing clip jigsaw
drawing: out/raw.svg
clip: out/clipped.svg
jigsaw: out/jigsaw.svg
.PHONY: all drawing clip jigsaw

out/raw.svg: main.js
	mkdir -p $(dir $@)
	node $<

out/jigsaw.svg out/box.svg: jigsaw.js
	mkdir -p $(dir $@)
	node $<

out/clipped.svg: out/raw.svg hlr
	time ./hlr -o $@ $<
