library(raster)


### Name: head
### Title: Show the head or tail of a Raster* object
### Aliases: head head,RasterLayer-method head,RasterStackBrick-method
###   head,Spatial-method tail tail,RasterLayer-method
###   tail,RasterStackBrick-method tail,Spatial-method
### Keywords: methods spatial

### ** Examples

r <- raster(nrow=25, ncol=25)
r[] = 1:ncell(r)
head(r)
tail(r, cols=10, rows=5)



