library(raster)


### Name: Extract by index
### Title: Indexing to extract values of a Raster* object
### Aliases: [[,Raster,ANY,ANY-method [,Raster,Spatial,missing-method
###   [,Raster,RasterLayer,missing-method [,Raster,Extent,missing-method
###   [,Raster,numeric,numeric-method [,Raster,numeric,missing-method
###   [,Raster,missing,numeric-method [,Raster,matrix,missing-method
###   [,Raster,missing,missing-method [,Raster,logical,missing-method
###   [,Extent,numeric,missing-method [,Extent,missing,missing-method
### Keywords: methods spatial

### ** Examples

r <- raster(ncol=10, nrow=5)
r[] <- 1:ncell(r) 

r[1]
r[1:10]
r[1,]
r[,1]
r[1:2, 1:2]

s <- stack(r, sqrt(r))
s[1:3]
s[[2]]




