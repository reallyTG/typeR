library(SpatEntropy)


### Name: coords_pix
### Title: Pixel coordinates generation.
### Aliases: coords_pix

### ** Examples

ccc=coords_pix(area=square(10), nrow=10, ncol=10)
plot(square(10)); points(ccc)

ccc=coords_pix(area=square(10), pixel.xsize = 2, pixel.ysize = 2)
plot(square(10)); points(ccc, pch=16)




