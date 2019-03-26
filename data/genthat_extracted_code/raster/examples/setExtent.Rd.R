library(raster)


### Name: setExtent
### Title: Set the extent of a RasterLayer
### Aliases: setExtent extent<-
### Keywords: spatial

### ** Examples

r <- raster()
bb <- extent(-10, 10, -20, 20)
extent(r) <- bb
r <- setExtent(r, bb, keepres=TRUE)




