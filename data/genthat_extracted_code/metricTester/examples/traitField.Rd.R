library(metricTester)


### Name: traitField
### Title: Calculate a species' trait field
### Aliases: traitField

### ** Examples

#simulate tree with birth-death process
tree <- geiger::sim.bdtree(b=0.1, d=0, stop="taxa", n=50)

#simulate trait evolution up the tree. Make 2-d trait space and find distances between
#species in that space
traits <- evolveTraits(tree)

#calculate the distances betweeen species
dists <- as.matrix(dist(traits[[2]], diag=TRUE, upper=TRUE))

#simulate log-normal abundances
sim.abundances <- round(rlnorm(5000, meanlog=2, sdlog=1)) + 1

#simulate a community data matrix with these inputs
cdm <- simulateComm(tree, richness.vector=10:25, abundances=sim.abundances)

#example trait field calculations
exampleField <- traitField(trait.distance=dists, picante.cdm=cdm, metric="naw.mpd")



