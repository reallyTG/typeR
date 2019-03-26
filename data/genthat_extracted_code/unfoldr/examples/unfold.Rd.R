library(unfoldr)


### Name: unfold
### Title: Stereological unfolding
### Aliases: unfold

### ** Examples

 lam <- 100
 # parameter rlnorm distribution (radii)
 theta <- list("size"=list("meanlog"=-2.5,"sdlog"=0.5))

 # simulation bounding box
 box <- list("xrange"=c(0,5),"yrange"=c(0,5),"zrange"=c(0,5))
 # simulate only 3D system
 S <- simPoissonSystem(theta,lam,size="rlnorm",box=box,type="spheres",
   perfect=TRUE, pl=1)

 # intersect
 sp <- planarSection(S,d=2.5,intern=TRUE,pl=1)

 # unfolding
 ret <- unfold(sp,nclass=25)
 cat("Intensities: ", sum(ret$N_V)/25, "vs.",lam,"\n")




