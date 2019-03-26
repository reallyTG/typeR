library(metricTester)


### Name: lengthNonZeros
### Title: Calculate the species richness of a vector from a CDM
### Aliases: lengthNonZeros

### ** Examples

#simulate tree with birth-death process
tree <- geiger::sim.bdtree(b=0.1, d=0, stop="taxa", n=50)

sim.abundances <- round(rlnorm(5000, meanlog=2, sdlog=1)) + 1

cdm <- simulateComm(tree, richness.vector=10:25, abundances=sim.abundances)

#note that with this example, each community in the cdm will be labeled by its richness
apply(cdm, 1, lengthNonZeros)



