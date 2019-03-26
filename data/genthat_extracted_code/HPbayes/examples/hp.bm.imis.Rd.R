library(HPbayes)


### Name: hp.bm.imis
### Title: Heligman-Pollard parameter estimator using Bayesian Melding with
###   Incremental Mixture Importance Sampling
### Aliases: hp.bm.imis
### Keywords: misc

### ** Examples

##a prior##
## Not run: 
##D data(HPprior)
##D q0 <- HPprior
##D ##number of deaths in each age group##
##D dx <- c(68, 47, 16, 10, 13, 29, 92, 151, 188, 179, 156, 155, 147, 150, 
##D 122, 106, 88, 113, 63, 38, 32, 8)
##D ##number at risk in each age group##
##D lx <- c(1974, 1906, 1860, 1844, 1834, 1823, 1793, 1700, 1549, 1361, 
##D 1181, 1025, 870, 721, 571, 450, 344, 256, 142, 79, 41, 8)
##D result <- hp.bm.imis(prior=q0, K=10, nrisk=lx, ndeath=dx) 
## End(Not run)



