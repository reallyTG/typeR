library(raster)


### Name: nlayers
### Title: Number of layers
### Aliases: nlayers nlayers,BasicRaster-method nlayers,Raster-method
###   nlayers,RasterStack-method nlayers,RasterBrick-method
###   nlayers,Spatial-method
### Keywords: spatial

### ** Examples

r <- raster(ncols=10, nrows=10)
r[] <- 1:ncell(r)
s <- stack(r, r, r)
nlayers(s)
s <- stack(s,s)
nlayers(s)
s <- dropLayer(s, 2:3)
nlayers(s)




