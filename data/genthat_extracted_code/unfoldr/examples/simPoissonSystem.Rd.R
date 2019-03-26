library(unfoldr)


### Name: simPoissonSystem
### Title: Poisson germ-grain process
### Aliases: simPoissonSystem

### ** Examples

 # intensity parameter
 lam <- 100

 # simulation bounding box
 box <- list("xrange"=c(0,5),"yrange"=c(0,5),"zrange"=c(0,5))

 # log normal size distribution with a constant shape factor and
 # concentration parameter (\code{kappa=1}) for the orientation, see reference [1] 
 theta <- list("size"=list("meanlog"=-2.5,"sdlog"=0.5),
               "shape"=list("s"=0.5),
               "orientation"=list("kappa"=1))

 S <- simPoissonSystem(theta,lam,size="rlnorm",box=box,type="oblate",pl=1) 
 length(S)




