library(bayesTFR)


### Name: tfr.predict
### Title: Generating Posterior Trajectories of the Total Fertility Rate
### Aliases: tfr.predict bayesTFR.prediction
### Keywords: models multivariate

### ** Examples

## Not run: 
##D sim.dir <- tempfile()
##D m <- run.tfr.mcmc(nr.chains=1, iter=10, output.dir=sim.dir, verbose=TRUE)
##D m3 <- run.tfr3.mcmc(sim.dir=sim.dir, nr.chains=2, iter=40, thin=1, verbose=TRUE)
##D pred <- tfr.predict(m, burnin=0, burnin3=10, verbose=TRUE)
##D summary(pred, country="Iceland")
##D unlink(sim.dir, recursive=TRUE)
## End(Not run)



