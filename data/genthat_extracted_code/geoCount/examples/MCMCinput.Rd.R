library(geoCount)


### Name: MCMCinput
### Title: Settings for the MCMC Algorithm
### Aliases: MCMCinput
### Keywords: MCMC

### ** Examples

## Not run: 
##D   input <- MCMCinput( run = 10000, run.S = 10, 
##D           rho.family = "rhoPowerExp", 
##D           Y.family = "Poisson", 
##D           priorSigma = "Halft", parSigma = c(1, 1),
##D           ifkappa=0,
##D           scales=c(0.5, 1.5, 0.9, 0.6, 0.5), 
##D           phi.bound=c(0.005, 1), 
##D           initials=list(c(-1, 2, 1), 1, 0.1, 1) )
##D   res <- runMCMC(Y, L=0, loc=loc, X=loc, MCMCinput = input )
## End(Not run)



