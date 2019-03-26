library(bayesTFR)


### Name: get.cov.gammas
### Title: Covariance Matrices of Gamma Parameters
### Aliases: get.cov.gammas
### Keywords: multivariate

### ** Examples

## Not run: 
##D sim.dir <- file.path(find.package("bayesTFR"), "ex-data", "bayesTFR.output")
##D cov.gammas <- get.cov.gammas(sim.dir=sim.dir, burnin=0)
##D m <- run.tfr.mcmc(nr.chains=1, iter=10, proposal_cov_gammas=cov.gammas, verbose=TRUE)
## End(Not run)



