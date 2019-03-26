library(RStoolbox)


### Name: rescaleImage
### Title: Linear Image Rescaling
### Aliases: rescaleImage

### ** Examples

## Create example data
data(lsat)
lsat2 <- lsat - 1000
lsat2

## Rescale lsat2 to match original lsat value range
lsat2_rescaled <- rescaleImage(lsat2, lsat)
lsat2_rescaled

## Rescale lsat to value range [0,1]
lsat2_unity <- rescaleImage(lsat2, ymin = 0, ymax = 1)
lsat2_unity



