library(raster)


### Name: setValues
### Title: Set values of a Raster object
### Aliases: values<- values<-,RasterLayer-method
###   values<-,RasterLayerSparse-method values<-,RasterStack-method
###   values<-,RasterBrick-method setValues setValues,RasterLayer-method
###   setValues,RasterLayerSparse-method setValues,RasterStack-method
###   setValues,RasterBrick-method
### Keywords: spatial methods

### ** Examples
 
r <- raster(ncol=10, nrow=10)
vals <- 1:ncell(r)
r <- setValues(r, vals)
# equivalent to
r[] <- vals



