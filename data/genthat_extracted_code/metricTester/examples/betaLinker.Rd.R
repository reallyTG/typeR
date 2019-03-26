library(metricTester)


### Name: betaLinker
### Title: Run spatial simulations, null and beta metric calculations
### Aliases: betaLinker

### ** Examples

system.time(test <- betaLinker(no.taxa=50, arena.length=300, mean.log.individuals=2, 
	length.parameter=5000, sd.parameter=50, max.distance=30, proportion.killed=0.2, 
competition.iterations=3, no.plots=15, plot.length=30,
randomizations=3, cores="seq", metrics=c("Pst", "Bst"),
nulls=c("richness", "frequency")))



