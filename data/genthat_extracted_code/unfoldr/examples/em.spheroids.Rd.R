library(unfoldr)


### Name: em.spheroids
### Title: Trivariate stereological unfolding
### Aliases: em.spheroids

### ** Examples

## Comment: Trivariate unfolding of spheroid distribution

## set number of cpu cores (optional)
options(par.unfoldr=2L)

## Intensity: mean number of spheroids per unit volume
lam <- 1000

## simulation parameters
theta <- list("size"=list("meanlog"=-2.5,"sdlog"=0.5),
		      "shape"=list(0.5),"orientation"=list("kappa"=2))
## simualtion
set.seed(1234)

S <- simPoissonSystem(theta,lam,size="rlnorm",
		orientation="rbetaiso",box=list(c(0,5)),type="prolate",pl=1)

## unfolding
sp <- verticalSection(S,2.5)
ret <- unfold(sp,c(7,6,5),kap=1.25)
cat("Intensities: ", sum(ret$N_V)/25, "vs.",lam,"\n")



