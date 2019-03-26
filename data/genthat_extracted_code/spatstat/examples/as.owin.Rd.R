library(spatstat)


### Name: as.owin
### Title: Convert Data To Class owin
### Aliases: as.owin as.owin.owin as.owin.ppp as.owin.ppm as.owin.kppm
###   as.owin.dppm as.owin.lpp as.owin.lppm as.owin.msr as.owin.psp
###   as.owin.quad as.owin.quadratcount as.owin.quadrattest as.owin.tess
###   as.owin.im as.owin.layered as.owin.data.frame as.owin.distfun
###   as.owin.nnfun as.owin.funxy as.owin.boxx as.owin.rmhmodel
###   as.owin.leverage.ppm as.owin.influence.ppm as.owin.default
### Keywords: spatial manip

### ** Examples

 w <- as.owin(c(0,1,0,1))
 w <- as.owin(list(xrange=c(0,5),yrange=c(0,10)))
 # point pattern
 data(demopat)
 w <- as.owin(demopat)
 # image
 Z <- as.im(function(x,y) { x + 3}, unit.square())
 w <- as.owin(Z)

 # Venables & Ripley 'spatial' package
 require(spatial)
 towns <- ppinit("towns.dat")
 w <- as.owin(towns)
 detach(package:spatial)



