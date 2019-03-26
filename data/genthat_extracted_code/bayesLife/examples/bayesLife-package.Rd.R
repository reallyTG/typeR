library(bayesLife)


### Name: bayesLife-package
### Title: Bayesian Projection of the Life Expectancy
### Aliases: bayesLife-package bayesLife
### Keywords: package

### ** Examples

## Not run: 
##D sim.dir <- tempfile()
##D m <- run.e0.mcmc(sex='F', nr.chains=1, iter=60, seed=1, thin=1, 
##D      output.dir=sim.dir, verbose=TRUE)
##D pred <- e0.predict(m, burnin=30, verbose=TRUE)
##D summary(pred, country="Canada")
##D unlink(sim.dir, recursive=TRUE)
## End(Not run)



