library(unfoldr)


### Name: digitizeProfiles
### Title: Digitization
### Aliases: digitizeProfiles

### ** Examples

 # simulation box
 box <- list("xrange"=c(0,5),"yrange"=c(0,5),"zrange"=c(0,5))
 # (exact) bivariate size-shape (isotropic) orientation distribution (spheroids)
 theta <- list("size"=list("mx"=-2.5,"my"=0.5, "sdx"=0.35,"sdy"=0.25,"rho"=0.15),
               "orientation"=list("kappa"=1))

 # return only 3D system
 S <- simPoissonSystem(theta,lam=100,size="rbinorm",box=box,type="prolate",
       intersect="original",n=c(0,1,0),mu=c(0,0,1),perfect=TRUE,pl=1)

 # vertical intersection w.r.t. 'mu' (z axis, see above)
 sp <- intersectSystem(S, 2.5)

 # show intersecting window
 win <- attr(sp,"win")

 # digitize (could also pass some 'win' as an argument) 	
 W <- digitizeProfiles(sp, delta=0.01, win = NULL)  
 image(1:nrow(W),1:ncol(W),W,col=gray(1:0))




