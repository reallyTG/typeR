## Simulate Poisson cylinder system,
## generate a non-overlapping system by RSA,

library(simLife)
library(unfoldr)

lam <- 35
box <- list("xrange"=c(0,3),"yrange"=c(0,3),"zrange"=c(0,9))

## Spheroids of constant sizes
theta <- list("size"=list(.5),"shape"=list("radius"=0.1),
		"orientation"=list("kappa"=0.1))

S <- simPoissonSystem(theta,lam,size="const",type="cylinders",
		orientation="rbetaiso",box=box,pl=1,label="P")

## secondary phase: particles as spheres
F <- simPoissonSystem(list("size"=list(0.075)), lam=5, size="const",
		type="spheres",box=box, pl=1, label="F")

## apply RSA
S2 <- rsa(S,F,verbose=TRUE)
length(S2)


