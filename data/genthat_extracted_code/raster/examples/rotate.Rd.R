library(raster)


### Name: rotate
### Title: Rotate
### Aliases: rotate rotate,Raster-method
### Keywords: spatial

### ** Examples


r <- raster(nrow=18, ncol=36)
m <- matrix(1:ncell(r), nrow=18)
r[] <- as.vector(t(m))
extent(r) <- extent(0, 360, -90, 90)
rr <- rotate(r)



