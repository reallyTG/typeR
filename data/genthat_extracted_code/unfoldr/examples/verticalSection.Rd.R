library(unfoldr)


### Name: verticalSection
### Title: Vertical sections
### Aliases: verticalSection

### ** Examples

 
 box <- list("xrange"=c(0,5),"yrange"=c(0,5),"zrange"=c(0,5))
 
 # (exact) bivariate size-shape (isotropic) orientation distribution (spheroids)
 theta <- list("size"=list("mx"=-2.5,"my"=0.5, "sdx"=0.35,"sdy"=0.25,"rho"=0.15),
		"orientation"=list("kappa"=1))

 S <- simPoissonSystem(theta,lam=100,size="rbinorm",box=box,
  type="prolate",perfect=TRUE,pl=1)

 sp <- verticalSection(S,d=2.5,n=c(0,1,0),intern=TRUE)
 summary(sp$alpha)
 



