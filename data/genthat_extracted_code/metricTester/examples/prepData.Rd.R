library(metricTester)


### Name: prepData
### Title: Prep data to test phylogenetic community structure metrics
### Aliases: prepData

### ** Examples

#simulate tree with birth-death process
tree <- geiger::sim.bdtree(b=0.1, d=0, stop="taxa", n=50)

sim.abundances <- round(rlnorm(5000, meanlog=2, sdlog=1)) + 1

cdm <- simulateComm(tree, richness.vector=10:25, abundances=sim.abundances)

prepped <- prepData(tree, cdm)



