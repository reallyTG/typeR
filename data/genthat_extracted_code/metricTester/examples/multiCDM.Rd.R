library(metricTester)


### Name: multiCDM
### Title: Wrapper for deriving CDMs from the results of multiple spatial
###   simulations
### Aliases: multiCDM

### ** Examples

#simulate tree with birth-death process
tree <- geiger::sim.bdtree(b=0.1, d=0, stop="taxa", n=50)

prepped <- prepSimulations(tree, arena.length=300, mean.log.individuals=2,
	length.parameter=1000, sd.parameter=50, max.distance=20, proportion.killed=0.2,
competition.iterations=5)

#run the spatial simulations
arenas <- runSimulations(prepped)

#derive CDMs. plots are placed in the same places across all spatial simulations.
#density of individuals per arena is low enough in this example that sometimes all
#plots contain < 2 species, and are cut, causing an error. this not run so as not to
#throw errors on CRAN
#cdms <- multiCDM(arenas, no.plots=10, plot.length=20)



