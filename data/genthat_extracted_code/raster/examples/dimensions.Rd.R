library(raster)


### Name: dim
### Title: Dimensions of a Raster* object
### Aliases: dim dim,RasterStackBrick-method dim,BasicRaster-method
###   dim<-,BasicRaster-method dim<-,RasterLayer-method
###   dim<-,RasterBrick-method
### Keywords: spatial

### ** Examples

r <- raster()
dim(r)
dim(r) <- c(18) 
dim(r)
dim(r) <- c(18, 36) 
dim(r)
b <- brick(r)
dim(b)
dim(b) <- c(10, 10, 5)
dim(b)



