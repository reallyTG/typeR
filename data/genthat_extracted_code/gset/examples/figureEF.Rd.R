library(gset)


### Name: figureEF
### Title: equivalence and futility boundary plots in group sequential
###   designs of equivalence studies
### Aliases: figureEF
### Keywords: group sequential design equivalence hypothesis equivalence
###   boundary

### ** Examples

  ## Not run: 
##D   L <- -0.2
##D   U <- 0.2
##D   theta <- 0
##D   sigma <- 0.4  
##D   alpha <- 0.05
##D   beta  <- 0.2
##D   K <- 4
##D   bound  <- binding(L, U, theta, sigma, n.fix$n1, n.fix$n2, 1:K/K, alpha, beta, plot=FALSE)  
##D   figureEF(bound, K, 3,6)
##D   
## End(Not run)



