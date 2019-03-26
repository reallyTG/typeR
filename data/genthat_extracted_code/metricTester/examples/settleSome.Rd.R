library(metricTester)


### Name: settleSome
### Title: Randomly settle individuals in a spatial arena
### Aliases: settleSome

### ** Examples

#simulate tree with birth-death process
tree <- geiger::sim.bdtree(b=0.1, d=0, stop="taxa", n=50)

#prep the data for the simulation
prepped <- prepSimulations(tree, arena.length=300, mean.log.individuals=2, 
length.parameter=5000, sd.parameter=50, max.distance=20, proportion.killed=0.2,
competition.iterations=5)

#use the competition simulation
positions <- competitionArena(prepped)

#in normal use, these parameters will be carried down from the simulations.input object
new.arena <- killSome(tree, arena.output=positions, max.distance=50, 
proportion.killed=0.2)

#now settle some indiviudals
newer.arena <- settleSome(new.arena)

#look at how number of individuals in arena changes
dim(new.arena$arena)
dim(newer.arena$arena)



