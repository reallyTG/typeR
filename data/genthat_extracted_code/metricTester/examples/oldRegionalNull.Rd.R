library(metricTester)


### Name: oldRegionalNull
### Title: Randomize community data matrix with regional null model
### Aliases: oldRegionalNull

### ** Examples

tree <- geiger::sim.bdtree(b=0.1, d=0, stop="taxa", n=50)

#prep the data for the simulation
prepped <- prepSimulations(tree, arena.length=300, mean.log.individuals=2, 
	length.parameter=5000, sd.parameter=50, max.distance=20, proportion.killed=0.2,
	competition.iterations=3)

positions <- competitionArena(prepped)

boundResults <- plotPlacer(no.plots=15, arena.length=300, plot.length=30)

#return a CDM in picante format
cdmTemp <- plotContents(positions$arena, boundResults)

test <- oldRegionalNull(cdmTemp$picante.cdm, tree, 
regional.abundance=abundanceVector(cdmTemp$picante.cdm))



