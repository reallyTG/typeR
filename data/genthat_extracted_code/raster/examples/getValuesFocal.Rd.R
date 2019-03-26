library(raster)


### Name: getValuesFocal
### Title: Get focal raster cell values
### Aliases: getValuesFocal getValuesFocal,Raster-method
###   getValuesFocal,Raster,missing,missing,numeric-method
###   getValuesFocal,Raster,numeric,numeric,numeric-method
### Keywords: spatial methods

### ** Examples

r <- raster(nr=5, nc=5, crs='+proj=utm +zone=12')
r[] <- 1:25
as.matrix(r)
getValuesFocal(r, row=1, nrows=2, ngb=3, names=TRUE)
getValuesFocal(stack(r,r), row=1, nrows=1, ngb=3, names=TRUE, array=TRUE)



