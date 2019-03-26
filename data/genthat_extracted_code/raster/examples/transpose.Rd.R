library(raster)


### Name: transpose
### Title: Transpose
### Aliases: t t,RasterLayer-method t,RasterStackBrick-method
### Keywords: spatial

### ** Examples

r <- raster(nrow=18, ncol=36)
r[] <- 1:ncell(r)
rt <- t(r)



