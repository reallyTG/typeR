library(raster)


### Name: dataType
### Title: Data type
### Aliases: dataType dataType<-
### Keywords: spatial

### ** Examples
 
r <- raster(system.file("external/test.grd", package="raster"))
dataType(r)
s <- writeRaster(r, 'new.grd', datatype='INT2U', overwrite=TRUE)
dataType(s)



