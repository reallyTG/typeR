library(unfoldr)


### Name: planarSection
### Title: Sphere planar sections
### Aliases: planarSection

### ** Examples

 lam <- 100
 
 # parameter rlnorm distribution (radii)
 theta <- list("size"=list("meanlog"=-2.5,"sdlog"=0.5))
 
 # simulation bounding box
 box <- list("xrange"=c(0,5),"yrange"=c(0,5),"zrange"=c(0,5))
 
 # simulate only 3D system
 S <- simPoissonSystem(theta,lam,size="rlnorm",box=box,type="spheres",
   intersect="original", pl=1)
 
 # return only objects whose centers are within
 # the intersection window
 sp <- planarSection(S,d=2.5,intern=TRUE,pl=1)
 
 # histogram of diameters
 hist(sp)
 summary(sp)
 
 # distribution of radii
 mean(log(sp/2))
 sd(log(sp/2))





