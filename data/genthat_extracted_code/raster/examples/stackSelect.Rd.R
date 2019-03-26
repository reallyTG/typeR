library(raster)


### Name: stackSelect
### Title: Select cell values from a multi-layer Raster* object
### Aliases: stackSelect stackSelect,RasterStackBrick,Raster-method
### Keywords: methods spatial

### ** Examples

r <- raster(ncol=10, nrow=10)
r[] <- 1
s <- stack(r, r+2, r+5)
r[] <- round((runif(ncell(r)))*3)
x <- stackSelect(s, r)



