library(raster)


### Name: atan2
### Title: Two argument arc-tangent
### Aliases: atan2,Raster,Raster-method atan2
### Keywords: methods math

### ** Examples

r1 <- r2 <- raster(nrow=10, ncol=10)
r1[] <- (runif(ncell(r1))-0.5) * 10
r2[] <- (runif(ncell(r1))-0.5) * 10
atan2(r1, r2)



