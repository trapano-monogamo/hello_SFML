CC := g++
CC_FLAGS := -Wall -Wextra -g

LIB := ./lib
BIN := ./bin
SRC := ./src
INCLUDE := ./include

LIBRARIES := libsfml-graphics.so.2.5.1 -lsfml-window -lsfml-system
EXECUTABLE := main

all: $(BIN)/$(EXECUTABLE)

run: all
	$(BIN)/$(EXECUTABLE)

$(BIN)/$(EXECUTABLE):$(SRC)/*.cpp
	$(CC) $(CC_FLAGS) -I$(INCLUDE) -L$(LIB) $^ -o $@ $(LIBRARIES)

.PHONY: debug

debug: all
	gdb ./bin/$(EXECUTABLE)

.PHONY: clear

clear:
	rm "$(BIN)/$(EXECUTABLE)"
