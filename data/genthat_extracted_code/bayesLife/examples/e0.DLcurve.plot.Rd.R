library(bayesLife)


### Name: e0.DLcurve.plot
### Title: Plotting Posterior Distribution of the Double Logistic Function
###   of Life Expectancy
### Aliases: e0.DLcurve.plot e0.DLcurve.plot.all e0.world.dlcurves
###   e0.country.dlcurves e0.parDL.plot
### Keywords: hplot

### ** Examples

## Not run: 
##D sim.dir <- file.path(find.package("bayesLife"), "ex-data", "bayesLife.output")
##D mcmc.set <- get.e0.mcmc(sim.dir=sim.dir)
##D e0.DLcurve.plot(mcmc.set, country="Japan", burnin=40)
##D e0.parDL.plot(mcmc.set, "Japan")
##D 
##D # add the median of the hierarchical DL curves
##D x <- seq(40, 90, length=100)
##D world <- e0.world.dlcurves(x, mcmc.set, burnin=40)
##D qw <- apply(world, 2, median) 
##D lines(x, qw, col='blue')
## End(Not run)



