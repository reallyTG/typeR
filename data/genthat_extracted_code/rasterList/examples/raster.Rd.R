library(rasterList)


### Name: raster,RasterList-method
### Title: 'Raster' methods for a 'RasterList-class' object.
### Aliases: raster raster,RasterList-method

### ** Examples


f <- system.file("external/test.grd", package="raster")
ur <- rasterList(raster(f),FUN=function(x,d){x+0:d},d=10)

r1 <- raster(ur)
r2 <- raster(ur,FUN=function(x){x[2]})




