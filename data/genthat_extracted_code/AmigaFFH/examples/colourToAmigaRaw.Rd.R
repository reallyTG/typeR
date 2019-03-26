library(AmigaFFH)


### Name: colourToAmigaRaw
### Title: Convert colours to Amiga compatible raw data or vice versa
### Aliases: colourToAmigaRaw amigaRawToColour

### ** Examples

## Let's create some Amiga palettes:
colourToAmigaRaw(c("red", "navy blue", "brown", "#34AC5A"))

## let's do the reverse.
## this is white:
amigaRawToColour(as.raw(c(0x0f, 0xff)))

## this is white specified in 3 bytes:
amigaRawToColour(as.raw(c(0xf0, 0xf0, 0xf0)), n.bytes = "3")

## lower nybbles are ignored, you will get a warning when it is not zero:
amigaRawToColour(as.raw(c(0xf0, 0xf0, 0x0f)), n.bytes = "3")



