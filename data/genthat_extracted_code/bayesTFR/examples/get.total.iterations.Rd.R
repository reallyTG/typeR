library(bayesTFR)


### Name: get.total.iterations
### Title: Total Number of Iterations
### Aliases: get.total.iterations get.stored.mcmc.length
### Keywords: manip

### ** Examples

sim.dir <- file.path(find.package("bayesTFR"), "ex-data", "bayesTFR.output")
mcmc.set <- get.tfr.mcmc(sim.dir=sim.dir)
get.total.iterations(mcmc.set$mcmc.list) # 60=1chain x 60iters
get.total.iterations(mcmc.set$mcmc.list, burnin=20) # 40=1x(60-20)

## Not run: 
##D sim.dir <- tempfile()
##D m <- run.tfr.mcmc(iter=10, nr.chains=2, output.dir=sim.dir, thin=5, verbose=TRUE)
##D get.total.iterations(m$mcmc.list) # 20=2x10
##D get.stored.mcmc.length(m$mcmc.list) # 6=2x3
##D unlink(sim.dir, recursive=TRUE)
## End(Not run)



