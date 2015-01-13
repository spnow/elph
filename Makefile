
SRCDIR=src
OBJDIR=obj
HDRDIR=include

EXEC=elfdump
CC=gcc
CFLAGS=-W -Wall -Wextra -I $(HDRDIR) -g
LDFLAGS=

_DEPS=binary.h elf64_read.h elf64_write.h header.h elf64_shr.h sym_tab.h fdetect.h elf64_program_header.h 
_SRC=elfdump.c elf64_read.c elf64_write.c header.c elf64_shr.c sym_tab.c fdetect.c elf64_program_header.c
_OBJ=$(_SRC:.c=.o)
DEPS=$(patsubst %,$(HDRDIR)/%,$(_DEPS))
OBJ=$(patsubst %,$(OBJDIR)/%,$(_OBJ))
SRC=$(patsubst %,$(SRCDIR)/%,$(_SRC))

all: $(EXEC)

$(EXEC): $(OBJ)
	$(CC) -o $@ $^ $(CFLAGS)

$(OBJDIR)/$(EXEC).o: $(DEPS)

$(OBJDIR)/%.o: $(SRCDIR)/%.c
	$(CC) -o $@ -c $< $(CFLAGS)

.PHONY: clean mrproper

clean:
	rm -rf $(OBJDIR)/*.o

mproper: clean
	rm -rf $(EXEC)
