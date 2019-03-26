library(move)


### Name: brownian.motion.variance.dyn
### Title: Calculates the dynamic brownian motion variance
### Aliases: brownian.motion.variance.dyn
###   brownian.motion.variance.dyn,MoveStack,numeric,numeric,numeric-method
###   brownian.motion.variance.dyn,.MoveTrackSingle,numeric,numeric,numeric-method
###   brownian.motion.variance.dyn,.MoveTrackSingleBurst,numeric,numeric,numeric-method

### ** Examples

data(leroy)
data2 <- spTransform(leroy[1:80,], CRSobj="+proj=aeqd +ellps=WGS84", center=TRUE)
err<-rep(23.5,n.locs(data2))
dBMvar <- brownian.motion.variance.dyn(data2, location.error=err, margin=13, window.siz=31)
dBMvar



