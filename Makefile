DEPS = $(wildcard *.h)
SRC = $(wildcard src/*.c)
OBJ = $(patsubst %.c, %.o, $(SRC))
TARGET = modbusd
CFLAGS+=-std=gnu99
RM = rm -f

ifneq (,$(findstring IO_SUPPORT,$(CFLAGS)))
	LDFLAGS += -lioman
endif


all: $(TARGET)

%.o: %.c $(DEPS)
	$(CC) -c -o $@ $< $(CFLAGS)

$(TARGET): $(OBJ)
	$(CC) -o $@ $^ $(LDFLAGS)

.PHONY: clean

clean:
	$(RM) $(OBJ) $(TARGET)

