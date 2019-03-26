library(raster)


### Name: Programming
### Title: Helper functions for programming
### Aliases: readStart readStop readStart,Raster-method
###   readStart,RasterStack-method readStop,Raster-method
###   readStop,RasterStack-method canProcessInMemory pbCreate pbStep
###   pbClose getCluster returnCluster
### Keywords: spatial

### ** Examples

r <- raster(nrow=100, ncol=100)
canProcessInMemory(r, 4)
r <- raster(nrow=50000, ncol=50000)
canProcessInMemory(r, 2, verbose=TRUE)
rasterOptions(maxmem=Inf, memfrac=.8)
rasterOptions(default=TRUE)



