library(raster)


### Name: getValues
### Title: Get raster cell values
### Aliases: values values,Raster-method getValues
###   getValues,RasterLayer,missing,missing-method
###   getValues,RasterLayerSparse,missing,missing-method
###   getValues,RasterStack,missing,missing-method
###   getValues,RasterBrick,missing,missing-method
###   getValues,RasterLayer,numeric,missing-method
###   getValues,RasterLayerSparse,numeric,missing-method
###   getValues,RasterStack,numeric,missing-method
###   getValues,RasterBrick,numeric,missing-method
###   getValues,RasterLayer,numeric,numeric-method
###   getValues,RasterLayerSparse,numeric,numeric-method
###   getValues,RasterStack,numeric,numeric-method
###   getValues,RasterBrick,numeric,numeric-method
### Keywords: spatial methods

### ** Examples

r <- raster(system.file("external/test.grd", package="raster"))
r
v <- getValues(r)
length(v)
head(v)
getValues(r, row=10)



