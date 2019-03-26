library(raster)


### Name: round
### Title: Integer values
### Aliases: round,RasterLayer-method trunc,RasterLayer-method
###   ceiling,RasterLayer-method floor,RasterLayer-method
### Keywords: spatial

### ** Examples

r <- raster(ncol=10, nrow=10)
r[] <- runif(ncell(r)) * 10
s <- round(r)




