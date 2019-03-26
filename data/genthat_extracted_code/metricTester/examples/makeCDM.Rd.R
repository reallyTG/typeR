library(metricTester)


### Name: makeCDM
### Title: Wrapper for creating a CDM from a spatial simulation result
### Aliases: makeCDM

### ** Examples

tree <- geiger::sim.bdtree(b=0.1, d=0, stop="taxa", n=50)

#prep the data for the simulation
prepped <- prepSimulations(tree, arena.length=300, mean.log.individuals=2, 
length.parameter=5000, sd.parameter=50, max.distance=20, proportion.killed=0.2,
competition.iterations=3)

competition <- competitionArena(prepped)

test <- makeCDM(competition, 15, 30)



