library(bayesTFR)


### Name: get.thinned.tfr.mcmc
### Title: Creating and Accessing Thinned MCMCs
### Aliases: get.thinned.tfr.mcmc create.thinned.tfr.mcmc
### Keywords: programming manip

### ** Examples

## Not run: 
##D sim.dir <- tempfile()
##D m <- run.tfr.mcmc(nr.chains=2, iter=30, seed=1, output.dir=sim.dir, verbose=TRUE)
##D tfr.predict(m, burnin=15, use.tfr3=FALSE) # creates thinned MCMCs
##D mb <- get.thinned.tfr.mcmc(m, thin=1, burnin=15)
##D summary(mb, meta.only=TRUE) # length 30 = 2chains x (30-15)iters.
##D unlink(sim.dir, recursive=TRUE)
## End(Not run)



