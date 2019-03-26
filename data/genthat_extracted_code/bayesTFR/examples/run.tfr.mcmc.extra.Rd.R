library(bayesTFR)


### Name: run.tfr.mcmc.extra
### Title: Run MCMC for Extra Countries, Areas or Regions
### Aliases: run.tfr.mcmc.extra
### Keywords: distribution multivariate

### ** Examples

## Not run: 
##D sim.dir <- tempfile()
##D m <- run.tfr.mcmc(nr.chains=1, iter=20, output.dir=sim.dir, verbose=TRUE)
##D m <- run.tfr.mcmc.extra(sim.dir=sim.dir, countries=c(908,924), burnin=10, verbose=TRUE)
##D summary(m, country=924)
##D pred <- tfr.predict(m, burnin=10, use.tfr3=FALSE, verbose=TRUE)
##D summary(pred, country=908)
##D unlink(sim.dir, recursive=TRUE)
## End(Not run)



