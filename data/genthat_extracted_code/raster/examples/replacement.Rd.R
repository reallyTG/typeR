library(raster)


### Name: replacement
### Title: Replace cell values or layers of a Raster* object
### Aliases: [<-,RasterLayer,RasterLayer,missing-method
###   [<-,RasterLayer,missing,missing-method
###   [<-,RasterStackBrick,Raster,missing-method
###   [<-,RasterStackBrick,missing,missing-method
###   [[<-,RasterStack,numeric,missing-method
###   [[<-,RasterBrick,numeric,missing-method
###   [[<-,RasterStackBrick,character,missing-method
###   [<-,Raster,numeric,numeric-method [<-,Raster,numeric,missing-method
###   [<-,Raster,matrix,missing-method [<-,Raster,logical,missing-method
###   [<-,Raster,missing,numeric-method [<-,Raster,Spatial,missing-method
###   [<-,Raster,Extent,missing-method [<-,Extent,numeric,missing-method
###   $<-,Raster-method $,Raster-method
### Keywords: methods spatial

### ** Examples

r <- raster(ncol=10, nrow=5)
r[] <- 1:ncell(r) * 2
r[1,] <- 1
r[,1] <- 2
r[1,1] <- 3

s <- stack(r, sqrt(r))
s[s<5] <- NA




