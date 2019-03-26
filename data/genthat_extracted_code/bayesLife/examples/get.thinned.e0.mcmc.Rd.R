library(bayesLife)


### Name: get.thinned.e0.mcmc
### Title: Creating and Accessing Thinned MCMCs
### Aliases: get.thinned.e0.mcmc create.thinned.e0.mcmc
### Keywords: programming manip

### ** Examples

## Not run: 
##D sim.dir <- tempfile()
##D m <- run.e0.mcmc(nr.chains=2, iter=60, thin=2, output.dir=sim.dir, verbose=TRUE)
##D e0.predict(m, burnin=30) # creates thinned MCMCs
##D mb <- get.thinned.e0.mcmc(m, thin=2, burnin=30)
##D summary(mb, meta.only=TRUE) # length 30 = 2chains x (60-30)iters./2thin
##D unlink(sim.dir, recursive=TRUE)
## End(Not run)


