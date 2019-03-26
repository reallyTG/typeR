library(raster)


### Name: stackApply
### Title: Apply a function on subsets of a RasterStack or RasterBrick
### Aliases: stackApply
### Keywords: methods spatial

### ** Examples

r <- raster(ncol=10, nrow=10)
r[]=1:ncell(r)
s <- brick(r,r,r,r,r,r)
s <- s * 1:6
b1 <- stackApply(s, indices=c(1,1,1,2,2,2), fun=sum)
b1
b2 <- stackApply(s, indices=c(1,2,3,1,2,3), fun=sum)
b2



