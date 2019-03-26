library(RandomFields)


### Name: RMmodelsSpacetime
### Title: Space-time Covariance Models
### Aliases: RMmodelsSpacetime RMmodelsSpaceTime space-time
### Keywords: spatial

### ** Examples
## Don't show: 
StartExample()
## End(Don't show)
RFoptions(seed=0) ## *ANY* simulation will have the random seed 0; set
##                   RFoptions(seed=NA) to make them all random again

## multiplicative separable model with exponential model in space
## and Gaussian in time
model <- RMexp(proj = "space") * RMgauss(proj = "time")
x <- T <- seq(0, 10, 0.1)
z <- RFsimulate(model, x=x, T=T)
plot(z)

## additive separable model with exponential model in space
## and Gaussian in time. The structure is getting rather simple,
## see the function stopifnot below
model <- RMexp(proj = "space") + RMgauss(proj = "time")
x <- T <- seq(0, 10, 0.1)
z <- RFsimulate(model, x=x, T=T)
stopifnot(sum(abs(apply(apply(z, 1, diff), 1, diff))) < 1e-14)
plot(z)
## Don't show: 
FinalizeExample()
## End(Don't show)



