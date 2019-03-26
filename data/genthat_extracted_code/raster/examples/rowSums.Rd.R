library(raster)


### Name: rowSums
### Title: rowSums and colSums for Raster objects
### Aliases: rowSums rowSums,Raster-method colSums colSums,Raster-method
### Keywords: spatial

### ** Examples

r <- raster(ncols=2, nrows=5)
values(r) <- 1:10
as.matrix(r)
rowSums(r)
colSums(r)



