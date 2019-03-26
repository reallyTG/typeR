library(raster)


### Name: disaggregate
### Title: Disaggregate
### Aliases: disaggregate disaggregate,Raster-method
### Keywords: spatial

### ** Examples

r <- raster(ncols=10, nrows=10)
rd <- disaggregate(r, fact=c(10, 2))
ncol(rd)
nrow(rd)
r[] <- 1:ncell(r)
rd <- disaggregate(r, fact=c(4, 2), method='bilinear')




