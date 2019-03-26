library(spatstat)


### Name: as.ppp
### Title: Convert Data To Class ppp
### Aliases: as.ppp as.ppp.ppp as.ppp.psp as.ppp.quad as.ppp.matrix
###   as.ppp.data.frame as.ppp.influence.ppm as.ppp.default
### Keywords: spatial manip

### ** Examples

 xy <- matrix(runif(40), ncol=2)
 pp <- as.ppp(xy, c(0,1,0,1))

 # Venables-Ripley format
 # check for 'spatial' package
 spatialpath <- system.file(package="spatial")
 if(nchar(spatialpath) > 0) {
   require(spatial)
   towns <- ppinit("towns.dat")
   pp <- as.ppp(towns) # converted to our format
   detach(package:spatial)
 }

 xyzt <- matrix(runif(40), ncol=4)
 Z <- as.ppp(xyzt, square(1))



