library(bayesLife)


### Name: run.e0.mcmc.extra
### Title: Run MCMC for Extra Countries, Areas or Regions
### Aliases: run.e0.mcmc.extra
### Keywords: distribution multivariate

### ** Examples

## Not run: 
##D m <- run.e0.mcmc(nr.chains=1, iter=20, thin=1, verbose=TRUE)
##D m <- run.e0.mcmc.extra(countries=c(908,924), burnin=10, verbose=TRUE)
##D summary(m, country=924)
##D pred <- e0.predict(burnin=10, verbose=TRUE)
##D summary(pred, country=908)
## End(Not run)



