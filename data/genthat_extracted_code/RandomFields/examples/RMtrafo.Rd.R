library(RandomFields)


### Name: RMtrafo
### Title: Transformation of coordinate systems
### Aliases: RMtrafo RFearth2cartesian RFearth2dist
### Keywords: spatial models

### ** Examples
## Don't show: 
StartExample()
## End(Don't show)
data(weather)
(coord <- weather[1:5, 3:4])

(z <- RFfctn(RMtrafo(new=RC_CARTESIAN_COORD), coord))
(z1 <- RFearth2cartesian(coord)) ## equals z
z1 - z ## 0, i.e., z1 and t(z) are the same
dist(z)


(d <- RFearth2dist(coord)) 
d - dist(z) ## 0, i.e., d and dist(z) are the same


## projection onto planes
RFoptions(zenit=c(-122,   47))
RFearth2cartesian(coord, system="gnomonic")
RFearth2cartesian(coord, system="orthographic")

## Don't show: 
## Not run: 
##D  # OK
##D 
##D ## RFearth2dist is more precise !!!
##D library("fields")
##D (system.time(z2 <- rdist.earth(coord, miles=FALSE)))
##D z2
##D 
##D (z2 - as.matrix(d)) / z2 * 100 ## RFearth2dist is more precise
##D 
##D 
##D # 
##D n <- 10000
##D system.time(for (i in 1:n) d <- RFearth2dist (coord))) ## the same as dist(t(z))
##D 
##D system.time(for (i in 1:n)z2 <- rdist.earth(xx)))
##D 
##D 
##D data(weather)
##D xx <- matrix(weather[, 3:4], ncol=2) [ 1:5, ]
##D 
##D xx <- weather[, 3:4][ 1:5, ]
##D Print(xx)
##D Print(yy <- RFfctn(RMtrafo(new=RC_CARTESIAN_COORD), xx), units="miles")
##D 
##D (z1 <- as.matrix(dist(t(yy))))
##D 
##D library(fields)
##D (z2 <- rdist.earth(xx))
##D 
##D (z1-z2) / z1 * 100
##D z1
## End(Not run)## End(Don't show)


## Don't show: 
FinalizeExample()
## End(Don't show)


