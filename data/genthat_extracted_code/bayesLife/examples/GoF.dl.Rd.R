library(bayesLife)


### Name: e0.dl.coverage
### Title: Goodness of Fit of the Double Logistic Function
### Aliases: e0.dl.coverage
### Keywords: htest

### ** Examples

## Not run: 
##D sim.dir <- file.path(find.package("bayesLife"), "ex-data", "bayesLife.output")
##D e0 <- get.e0.mcmc(sim.dir)
##D # Note that this simulation is a toy example and thus has not converged.
##D gof <- e0.dl.coverage(sim.dir)
##D gof$country.coverage
##D e0.DLcurve.plot(e0, country=608, predictive.distr=TRUE, pi=c(80, 90, 95))
## End(Not run)


