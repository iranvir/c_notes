CC = cc
CFLAGS = -Wall -Wextra -pedantic -Wmissing-prototypes -Wstrict-prototypes -Wold-style-definition
SOURCE_DIR := ./source
BUILD_DIR := ./build
C_FILES := $(shell find $(SOURCE_DIR) -name '*.c')
BIN_FILES := $(patsubst $(SOURCE_DIR)%.c,$(BUILD_DIR)%, $(C_FILES))
$(BUILD_DIR)/%: $(SOURCE_DIR)/%.c
	@mkdir -p $(dir $@)
	$(CC) $(CFLAGS) $< -o $@
	strip --strip-all $@
clean:
	@rm -rf ./build/
all: $(BIN_FILES)
