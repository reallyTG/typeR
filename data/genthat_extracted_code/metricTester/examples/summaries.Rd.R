library(metricTester)


### Name: summaries
### Title: Return summary statistics from a data frame of randomized metric
###   values
### Aliases: summaries

### ** Examples

#simulate tree with birth-death process
tree <- geiger::sim.bdtree(b=0.1, d=0, stop="taxa", n=50)

sim.abundances <- round(rlnorm(5000, meanlog=2, sdlog=1)) + 1

cdm <- simulateComm(tree, richness.vector=10:25, abundances=sim.abundances)

#run the metrics and nulls combo function
rawResults <- metricsNnulls(tree=tree, picante.cdm=cdm, randomizations=2, cores="seq",
nulls=c("richness","frequency"), metrics=c("richness","NAW_MPD"))

#summarize the results
results <- reduceRandomizations(rawResults)

test <- summaries(results$frequency, concat.by="richness")



