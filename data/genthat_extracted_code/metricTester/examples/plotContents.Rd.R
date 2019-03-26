library(metricTester)


### Name: plotContents
### Title: Identify individuals contained within a plot
### Aliases: plotContents

### ** Examples

tree <- geiger::sim.bdtree(b=0.1, d=0, stop="taxa", n=50)

temp <- evolveTraits(tree)

phydistmatrix <- ape::cophenetic.phylo(temp[[1]])

#define a color for each species
cols <- plotrix::color.scale(x=1:nrow(phydistmatrix),
cs1=c(0.2,0.4,0.8), cs2=c(0,0.5,0.8), cs3=c(1,0.5,0))

#prep the data for the simulation
prepped <- prepSimulations(tree, arena.length=300, mean.log.individuals=2, 
length.parameter=5000, sd.parameter=50, max.distance=20, proportion.killed=0.2,
competition.iterations=3)

singleArena <- filteringArena(prepped)

#plot the arena. don't close the window
plot(singleArena$arena$X, singleArena$arena$Y, pch=20, cex=1, xlim=c(0,300), 
ylim=c(0,300), col=cols[singleArena$arena$individuals])

boundResults <- plotPlacer(no.plots=10, arena.length=300, plot.length=50)

plotPlotter(boundResults$plot.bounds)

#return a CDM in picante format
cdm <- plotContents(singleArena$arena, boundResults)



