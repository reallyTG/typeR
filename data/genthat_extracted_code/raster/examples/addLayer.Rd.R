library(raster)


### Name: addLayer
### Title: Add or drop a layer
### Aliases: addLayer addLayer,Raster-method dropLayer
###   dropLayer,RasterStack-method dropLayer,RasterBrick-method
### Keywords: spatial

### ** Examples

file <- system.file("external/test.grd", package="raster")
s <- stack(file, file, file)
r <- raster(file)
s <- addLayer(s, r/2, r*2)
s
s <- dropLayer(s, c(3, 5))
nlayers(s)



