library(gdistance)


### Name: raster-methods
### Title: RasterLayer from TransitionLayer object
### Aliases: raster,TransitionLayer-method
### Keywords: spatial

### ** Examples

#create a new raster and set all its values to unity.
r <- raster(nrows=18, ncols=36) 
r <- setValues(r,runif(ncell(r),0,1))

#create a Transition object from the raster
tr1 <- transition(r,mean,8)

#asymmetric
asf <- function(x) max(x) - x[1] + x[2]
tr2 <- transition(r,asf,8, symm=FALSE)

#create RasterLayer objects
r1 <- raster(tr1)
r2 <- raster(tr2)
r3 <- raster(tr1, "colMeans")



