library(raster)


### Name: getValuesBlock
### Title: Get a block of raster cell values
### Aliases: getValuesBlock getValuesBlock,RasterLayer-method
###   getValuesBlock,RasterLayerSparse-method
###   getValuesBlock,RasterStack-method getValuesBlock,RasterBrick-method
### Keywords: spatial methods

### ** Examples

r <- raster(system.file("external/test.grd", package="raster"))
b <- getValuesBlock(r, row=100, nrows=3, col=10, ncols=5)
b 
b <- matrix(b, nrow=3, ncol=5, byrow=TRUE)
b

logo <- brick(system.file("external/rlogo.grd", package="raster"))
getValuesBlock(logo, row=35, nrows=3, col=50, ncols=3, lyrs=2:3)



