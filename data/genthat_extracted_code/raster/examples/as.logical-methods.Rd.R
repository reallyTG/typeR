library(raster)


### Name: as.logical
### Title: Change cell values to logical or integer values
### Aliases: as.logical,Raster-method as.integer,Raster-method
### Keywords: methods spatial

### ** Examples

r <- raster(nrow=10, ncol=10)
set.seed(0)
r[] <- runif(ncell(r)) * 10
r
r <- as.integer(r)
r
as.logical(r)



