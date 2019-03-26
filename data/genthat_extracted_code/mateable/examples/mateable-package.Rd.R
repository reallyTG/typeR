library(mateable)


### Name: mateable-package
### Title: Tools to simulate, manage, visualize, and jointly analyze
###   spatially and temporally explicit datasets of mating potential
### Aliases: mateable mateable-package

### ** Examples

library(mateable)

pop <- simulateScene()
pop

plotScene(pop)
plotScene(pop, "t")

plot3DScene(pop)

sync <- synchrony(pop, "augs")
prox <- proximity(pop, "maxPropSqrd")
plotPotential(sync)
plotPotential(prox, "ind")


str(eelr2012)
ee <- makeScene(eelr2012, FALSE, "firstDay", "lastDay", "Ecoord", "Ncoord", idCol = "tagNo")




