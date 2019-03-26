library(nLTT)


### Name: mcmc_nltt
### Title: Code to perform Metropolis-Hastings MCMC for a diversification
###   model, given a phylogenetic tree. This function was used in the MEE
###   paper to calculate the likelihood reference estimates.
### Aliases: mcmc_nltt
### Keywords: MCMC Likelihood

### ** Examples


## MCMC examples are typically very slow ####
## Not run: 
##D 
##D require(TESS);
##D 
##D obs <- TESS.sim.age(n = 1, lambda = 0.5, mu = 0.1, age = 10)[[1]];
##D 
##D LL_BD <- function(params, phy) {
##D  lnl <- tess.likelihood(phy, lambda = params[1], mu = params[2],
##D  							  samplingProbability = 1, log = TRUE);
##D  prior1 <- dunif( params[1], 0, 100, log = TRUE)
##D  prior2 <- dunif( params[2], 0, 100, log = TRUE);
##D  return(lnl + prior1 + prior2);
##D }
##D 
##D require(coda);
##D 
##D mcmc_out <- mcmc_nltt(obs, LL_BD, c(0.5, 0.1), c(TRUE, TRUE),
##D 			iterations = 1000, burnin = 100, thinning = 10, sigma = 1)
##D plot(mcmc_out);
## End(Not run)




