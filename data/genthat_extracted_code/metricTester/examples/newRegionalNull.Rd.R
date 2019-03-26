library(metricTester)


### Name: newRegionalNull
### Title: Randomize community data matrix with second-gen regional null
###   model
### Aliases: newRegionalNull

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

test <- newRegionalNull(cdmTemp$picante.cdm,
regional.abundance=abundanceVector(cdmTemp$picante.cdm))



