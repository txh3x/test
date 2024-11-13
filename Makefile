# Compiler
CC = clang
CXX = clang++

# Flags
CFLAGS = -Wall -Wextra -O2
CXXFLAGS = $(CFLAGS)
LDFLAGS = 

# Project name (used for the output executable)
PROJECT_NAME = my_program
TARGET = bin/$(PROJECT_NAME)
SRC = $(wildcard src/*.c src/*.cpp)

# Default architecture (can be overridden with 'make ARCH=32' or 'make ARCH=64')
ARCH ?= 64

# Architecture-specific flags
ifeq ($(ARCH), 32)
    CFLAGS += -m32
    CXXFLAGS += -m32
    LDFLAGS += -m32
else ifeq ($(ARCH), 64)
    CFLAGS += -m64
    CXXFLAGS += -m64
    LDFLAGS += -m64
endif

# Build rules
all: $(TARGET)

$(TARGET): $(SRC)
	@echo "Compiling project for $(ARCH)-bit..."
	$(CC) $(SRC) $(CFLAGS) -o $(TARGET)

clean:
	rm -f $(TARGET)

