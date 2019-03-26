library(raster)


### Name: Math-methods
### Title: Mathematical functions
### Aliases: Math-methods Math2,Extent-method Math2,Raster-method
###   Math,Raster-method Math,RasterLayerSparse-method log,Raster-method
### Keywords: spatial methods math

### ** Examples

r1 <- raster(nrow=10, ncol=10)
r1 <- setValues(r1, runif(ncell(r1)) * 10)
r2 <- sqrt(r1)
s <- stack(r1, r2) - 5
b <- abs(s)



