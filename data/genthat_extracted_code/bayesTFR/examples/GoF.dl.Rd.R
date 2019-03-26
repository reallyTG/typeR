library(bayesTFR)


### Name: tfr.dl.coverage
### Title: Goodness of Fit of the Double Logistic Function
### Aliases: tfr.dl.coverage
### Keywords: htest

### ** Examples

## Not run: 
##D sim.dir <- file.path(find.package("bayesTFR"), "ex-data", "bayesTFR.output")
##D tfr <- get.tfr.mcmc(sim.dir)
##D # Note that this simulation is a toy example and thus has not converged.
##D gof <- tfr.dl.coverage(sim.dir)
##D gof$time.coverage
##D DLcurve.plot(tfr, country=608, predictive.distr=TRUE, pi=c(80, 90, 95))
## End(Not run)



