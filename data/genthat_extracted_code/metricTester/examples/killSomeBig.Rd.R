library(metricTester)


### Name: killSomeBig
### Title: Remove most closely related individuals for large arenas
### Aliases: killSomeBig

### ** Examples

#simulate tree with birth-death process
tree <- geiger::sim.bdtree(b=0.1, d=0, stop="taxa", n=50)

#prep the data for the simulation
prepped <- prepSimulations(tree, arena.length=300, mean.log.individuals=1, 
length.parameter=5000, sd.parameter=50, max.distance=20, proportion.killed=0.2,
competition.iterations=5)

#use the random simulation to generate a starting arena
random <- randomArena(prepped)

#in normal use, these parameters will be carried down from the simulations.input object
new.arena <- killSomeBig(tree, arena.output=random, max.distance=50, 
proportion.killed=0.2)

#look at how number of individuals in arena changes
dim(random$arena)
dim(new.arena$arena)



