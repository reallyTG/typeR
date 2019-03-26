library(raster)


### Name: as.matrix
### Title: Get a vector, matrix, or array with raster cell values
### Aliases: as.vector as.matrix as.array as.array,RasterStackBrick-method
###   as.array,RasterLayer-method as.matrix,RasterStackBrick-method
###   as.matrix,RasterLayer-method as.matrix,Extent-method
###   as.vector,Extent-method as.vector,Raster-method
### Keywords: spatial methods

### ** Examples

r <- raster(ncol=3, nrow=3)
r[] <- 1:ncell(r)
as.matrix(r)
s <- stack(r,r)
as.array(s)
as.vector(extent(s))



