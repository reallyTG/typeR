library(bayesTFR)


### Name: run.tfr3.mcmc
### Title: Running Markov Chain Monte Carlo for Parameters of Total
###   Fertility Rate in Phase III
### Aliases: run.tfr3.mcmc continue.tfr3.mcmc
### Keywords: distribution multivariate

### ** Examples

## Not run: 
##D sim.dir <- tempfile()
##D # Runs Phase II MCMCs (must be run before Phase III)
##D m <- run.tfr.mcmc(nr.chains=1, iter=5, output.dir=sim.dir, verbose=TRUE)
##D # Runs Phase III MCMCs
##D m3 <- run.tfr3.mcmc(sim.dir=sim.dir, nr.chains=2, iter=50, thin=1, verbose=TRUE)
##D m3 <- continue.tfr3.mcmc(sim.dir=sim.dir, iter=10, verbose=TRUE)
##D summary(m3, burnin=10)
##D unlink(sim.dir, recursive=TRUE)
## End(Not run)



