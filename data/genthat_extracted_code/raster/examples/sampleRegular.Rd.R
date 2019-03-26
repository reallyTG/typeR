library(raster)


### Name: sampleRegular
### Title: Regular sample
### Aliases: sampleRegular sampleRegular,Raster-method
### Keywords: spatial

### ** Examples

 r <- raster(system.file("external/test.grd", package="raster"))
 v <- sampleRegular(r, size=100)
 x <- sampleRegular(r, size=100, asRaster=TRUE)



