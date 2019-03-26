library(metricTester)


### Name: runNulls
### Title: Randomize input CDM according to defined null models
### Aliases: runNulls

### ** Examples

#simulate tree with birth-death process
tree <- geiger::sim.bdtree(b=0.1, d=0, stop="taxa", n=50)

sim.abundances <- round(rlnorm(5000, meanlog=2, sdlog=1)) + 1

cdm <- simulateComm(tree, richness.vector=10:25, abundances=sim.abundances)

prepped <- prepNulls(tree, cdm)

results <- runNulls(prepped)



