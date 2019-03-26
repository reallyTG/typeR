library(raster)


### Name: mask
### Title: Mask values in a Raster object
### Aliases: mask mask,RasterLayer,RasterLayer-method
###   mask,RasterStackBrick,RasterLayer-method
###   mask,RasterLayer,RasterStackBrick-method
###   mask,RasterStackBrick,RasterStackBrick-method
###   mask,Raster,Spatial-method mask,Raster,sf-method
### Keywords: methods spatial

### ** Examples

r <- raster(ncol=10, nrow=10)
m <- raster(ncol=10, nrow=10)
r[] <- runif(ncell(r)) * 10
m[] <- runif(ncell(r))
m[m < 0.5] <- NA
mr <- mask(r, m)

m2 <- m > .7
mr2 <- mask(r, m2, maskvalue=TRUE)



