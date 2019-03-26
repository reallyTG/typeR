library(bayesTFR)


### Name: DLcurve.plot
### Title: Plotting Posterior Distribution of the Double Logistic Function
### Aliases: DLcurve.plot DLcurve.plot.all tfr.world.dlcurves
###   tfr.country.dlcurves
### Keywords: hplot

### ** Examples

## Not run: 
##D sim.dir <- file.path(find.package("bayesTFR"), "ex-data", "bayesTFR.output")
##D mcmc.set <- get.tfr.mcmc(sim.dir=sim.dir)
##D DLcurve.plot(country="Burkina Faso", mcmc.set, burnin=15)
##D 
##D # add the median of the hierarchical DL curves
##D x <- seq(0, 10, length=100)
##D world <- tfr.world.dlcurves(x, mcmc.set, burnin=15, countryUc="Burkina Faso")
##D qw <- apply(world, 2, median) 
##D lines(x, qw, col='blue')
## End(Not run)



