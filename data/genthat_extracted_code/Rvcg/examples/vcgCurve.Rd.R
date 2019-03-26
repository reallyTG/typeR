library(Rvcg)


### Name: vcgCurve
### Title: calculate curvature of a triangular mesh
### Aliases: vcgCurve

### ** Examples


data(humface)
curv <- vcgCurve(humface)
##visualise per vertex mean curvature
## Not run: 
##D require(Morpho)
##D meshDist(humface,distvec=curv$meanvb,from=-0.2,to=0.2,tol=0.01)
## End(Not run)



