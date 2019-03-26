library(metricTester)


### Name: reduceRandomizations
### Title: Reduce randomized results to a manageable list of dataframes
### Aliases: reduceRandomizations

### ** Examples

#simulate tree with birth-death process
tree <- geiger::sim.bdtree(b=0.1, d=0, stop="taxa", n=50)

sim.abundances <- round(rlnorm(5000, meanlog=2, sdlog=1)) + 1

cdm <- simulateComm(tree, richness.vector=10:25, abundances=sim.abundances)

#below not run for timing issues on CRAN
rawResults <- metricsNnulls(tree, cdm, metrics=c("richness", "NAW_MPD"),
nulls=c("richness", "frequency"))

results <- reduceRandomizations(rawResults)



