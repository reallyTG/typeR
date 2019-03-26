library(raster)


### Name: flip
### Title: Flip
### Aliases: flip flip,RasterLayer-method flip,RasterStackBrick-method
### Keywords: spatial

### ** Examples

r <- raster(nrow=18, ncol=36)
m <- matrix(1:ncell(r), nrow=18)
r[] <- as.vector(t(m))
rx <- flip(r, direction='x')
r[] <- as.vector(m)
ry <- flip(r, direction='y')



