# Makefile contributed by jtsiomb

src = pi.asm

.PHONY: all
all: pi.img pi.com

pi.img: $(src)
	nasm -f bin -o $@ $(src)

pi.com: $(src)
	nasm -f bin -o $@ -Dcom_file=1 $(src)

.PHONY: clean
clean:
	$(RM) pi.img pi.com

.PHONY: rundosbox
rundosbox: pi.com
	dosbox $<

.PHONY: runqemu
runqemu: pi.img
	qemu-system-i386 -fda pi.img
