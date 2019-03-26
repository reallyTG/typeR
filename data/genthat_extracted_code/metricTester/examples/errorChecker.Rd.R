library(metricTester)


### Name: errorChecker
### Title: Wrapper for summarizing randomizations and testing significance
###   of observed metrics
### Aliases: errorChecker

### ** Examples

#simulate tree with birth-death process
tree <- geiger::sim.bdtree(b=0.1, d=0, stop="taxa", n=50)

#simulate a log normal abundance distribution
sim.abundances <- round(rlnorm(5000, meanlog=2, sdlog=1)) + 1

#simulate a community of varying richness
cdm <- simulateComm(tree, richness.vector=10:13, abundances=sim.abundances)

#run the metrics and nulls combo function
rawResults <- metricsNnulls(tree=tree, picante.cdm=cdm, randomizations=2, cores="seq",
nulls=c("richness","frequency"), metrics=c("richness","NAW_MPD"))

#summarize the results
results <- reduceRandomizations(rawResults)

#calculate the observed metrics from the input CDM
observed <- observedMetrics(tree, cdm, metrics=c("richness", "NAW_MPD"))

test <- errorChecker(observed, results, "richness")



