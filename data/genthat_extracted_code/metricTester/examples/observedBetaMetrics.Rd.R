library(metricTester)


### Name: observedBetaMetrics
### Title: Wrapper for prepping and calculating observed beta metrics
### Aliases: observedBetaMetrics

### ** Examples

tree <- geiger::sim.bdtree(b=0.1, d=0, stop="taxa", n=50)

#prep the data for the simulation
prepped <- prepSimulations(tree, arena.length=300, mean.log.individuals=2, 
	length.parameter=5000, sd.parameter=50, max.distance=20, proportion.killed=0.2,
	competition.iterations=3)

positions <- randomArena(prepped)

tempCDM <- makeCDM(positions, 15, 30)

results <- observedBetaMetrics(tree=tree, picante.cdm=tempCDM$picante.cdm)

#example of how to pass specific metrics to be calculated. not run

#results <- observedBetaMetrics(tree=tree, picante.cdm=tempCDM$picante.cdm, 
#metrics=c("richness", "Ist"))



