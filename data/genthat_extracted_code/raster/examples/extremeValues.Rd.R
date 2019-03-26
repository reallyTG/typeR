library(raster)


### Name: extremeValues
### Title: Minimum and maximum values
### Aliases: minValue maxValue minValue,RasterLayer-method
###   minValue,RasterStack-method minValue,RasterBrick-method
###   maxValue,RasterLayer-method maxValue,RasterStack-method
###   maxValue,RasterBrick-method
### Keywords: spatial

### ** Examples

r <- raster()
r <- setValues(r, 1:ncell(r))
minValue(r)
maxValue(r)
r <- setValues(r, round(100 * runif(ncell(r)) + 0.5))
minValue(r)
maxValue(r)

r <- raster(system.file("external/test.grd", package="raster"))
minValue(r)
maxValue(r)



