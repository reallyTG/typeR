library(raster)


### Name: brick
### Title: Create a RasterBrick object
### Aliases: brick brick,character-method brick,missing-method
###   brick,RasterLayer-method brick,RasterStack-method
###   brick,RasterBrick-method brick,Extent-method brick,array-method
###   brick,big.matrix-method brick,list-method brick,SpatialPixels-method
###   brick,SpatialGrid-method brick,kasc-method brick,grf-method
### Keywords: methods spatial

### ** Examples

b <- brick(system.file("external/rlogo.grd", package="raster"))
b
nlayers(b)
names(b)
extract(b, 870)



