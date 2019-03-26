library(adfExplorer)


### Name: boot.block.code
### Title: Minimal executable code for a bootblock
### Aliases: boot.block.code

### ** Examples

data("boot.block.code")

## To create a basic boot block for a DD disk:
bblock <- new("amigaBlock", data =
  c(as.raw(c(0x44, 0x4F, 0x53, 0x00, 0xE3, 0x3D, 0x0E, 0x73,
  0x00, 0x00, 0x03, 0x70)), unlist(boot.block.code$assembled),
  raw(419))
)
## The raw data preceding the executable code are
## a label, flags and a checksum.



