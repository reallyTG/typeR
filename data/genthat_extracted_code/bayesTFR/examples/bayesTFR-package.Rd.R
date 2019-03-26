library(bayesTFR)


### Name: bayesTFR-package
### Title: Bayesian Fertility Projection
### Aliases: bayesTFR-package bayesTFR
### Keywords: package

### ** Examples

## Not run: 
##D # This command produces output data such as in the directory ex-data
##D sim.dir <- tempfile()
##D # Phase II MCMCs
##D m <- run.tfr.mcmc(nr.chains=1, iter=60, output.dir=sim.dir, seed=1, verbose=TRUE)
##D # Phase III MCMCs (not included in the package)
##D m3 <- run.tfr3.mcmc(sim.dir=sim.dir, nr.chains=2, iter=100, thin=1, seed=1, verbose=TRUE)
##D # Prediction
##D pred <- tfr.predict(m, burnin=30, burnin3=50, verbose=TRUE)
##D summary(pred, country='Ghana')
##D unlink(sim.dir, recursive=TRUE)
## End(Not run)



