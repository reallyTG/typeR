library(geoCount)


### Name: runMCMC
### Title: Perform Robust MCMC Algorithms for GLSM
### Aliases: runMCMC
### Keywords: MCMC

### ** Examples

## Not run: 
##D   data(Weed)
##D   Y <- Weed[,3]
##D   loc <- unifLoc(Weed[,1:2])
##D   L <- rep(1, length(Y))
##D   input.Weed <- MCMCinput( run=1000, run.S=10, rho.family="rhoPowerExp", 
##D           Y.family = "Poisson", 
##D           priorSigma = "Halft", parSigma = c(1, 1),
##D           ifkappa=0,
##D           scales=c(0.5, 3.5, 0.9, 0.6, 0.5), 
##D           phi.bound=c(0.005, 1), 
##D           initials=list(c(-1), 1, 0.1, 1) )
##D   res <- runMCMC(Y, L=L, loc=loc, X=NULL, MCMCinput = input.Weed )          
## End(Not run)



