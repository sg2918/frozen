CROSS_COMPILE	?=
CC		 = $(CROSS_COMPILE)gcc

CFLAGS		+= -Iinclude -fPIC
BUILD_DIR	 = build

all: $(BUILD_DIR)/libfrozen.so $(BUILD_DIR)/test_frozen

$(BUILD_DIR)/%.o: src/%.c | $(BUILD_DIR)
	$(CC) -c -o $@ $< $(CFLAGS)

$(BUILD_DIR)/libfrozen.so: $(BUILD_DIR)/frozen.o | $(BUILD_DIR)
	$(CC) -shared -o $@ $^

$(BUILD_DIR)/test_frozen: $(BUILD_DIR)/unit_test.o | $(BUILD_DIR)
	$(CC) -o $@ $^

clean:
	rm -rf $(BUILD_DIR)

$(BUILD_DIR):
	mkdir -p $@
