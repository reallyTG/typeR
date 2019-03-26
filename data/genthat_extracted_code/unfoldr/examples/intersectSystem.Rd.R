library(unfoldr)


### Name: intersectSystem
### Title: Intersection in 3D
### Aliases: intersectSystem

### ** Examples

 box <- list("xrange"=c(0,5),"yrange"=c(0,5),"zrange"=c(0,5))
 
 # constant size-shape orientation distribution (spheroids)
 theta <- list("size"=list(0.1),"shape"=list(0.5), "orientation"=list("kappa"=10))

 S <- simPoissonSystem(theta,lam=100,box=box,type="prolate",pl=1)
 
 # return short version of section profiles
 sp <- intersectSystem(S, 2.5, pl=10)		




