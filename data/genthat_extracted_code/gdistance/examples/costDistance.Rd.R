library(gdistance)


### Name: costDistance
### Title: Cost distance (least-cost distance)
### Aliases: costDistance
###   costDistance,TransitionLayer,Coords,missing-method
###   costDistance,TransitionLayer,Coords,Coords-method
### Keywords: spatial

### ** Examples

#create a new raster and set all its values to unity.
r <- raster(nrows=18, ncols=36) 
r <- setValues(r,runif(ncell(r),0,1))

#create a Transition object from the raster
tr <- transition(r,function(x) 1/mean(x),8)

#asymmetric
ncf <- function(x) max(x) - x[1] + x[2]
tr2 <- transition(r,ncf,8, symm=FALSE)

#create two sets of coordinates
sP1 <- cbind(c(65,5,-65),c(55,35,-35))
sP2 <- cbind(c(50,15,-40),c(80,20,-5))

#from and to identical
costDistance(tr,sP1)
costDistance(tr2,sP1)

#from and to different
costDistance(tr,sP1,sP2)
costDistance(tr2,sP1,sP2)




