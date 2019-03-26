library(AmigaFFH)


### Name: hardwareSprite-class
### Title: The hardwareSprite class
### Aliases: hardwareSprite-class hardwareSprite

### ** Examples

## This generates a sprite of a single line (16x1 pixels) with an empty bitmap:
new("hardwareSprite")

## This generates a sprite of a single line (16x1 pixels) where
## the bitmap contains some coloured pixels:
new("hardwareSprite", bitmap = as.raw(c(0x01,0x02,0x03,0x04)))

## This generates a sprite of 16x16 pixels:
new("hardwareSprite",
    VStop = 16,
    bitmap = as.raw(sample.int(255, 64, replace = TRUE)))



