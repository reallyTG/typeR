library(metricTester)


### Name: plotTest
### Title: Calculate if single, observed metrics deviate beyond
###   expectations
### Aliases: plotTest

### ** Examples

#simulate tree with birth-death process
tree <- geiger::sim.bdtree(b=0.1, d=0, stop="taxa", n=50)

#simulate a log normal abundance distribution
sim.abundances <- round(rlnorm(5000, meanlog=2, sdlog=1)) + 1

#simulate a community of varying richness
cdm <- simulateComm(tree, richness.vector=10:25, abundances=sim.abundances)

#below not run for example timing issues on CRAN

#run the metrics and nulls combo function
rawResults <- metricsNnulls(tree=tree, picante.cdm=cdm, randomizations=2, cores="seq",
nulls=c("richness","frequency"), metrics=c("richness","NAW_MPD"))

#reduce the randomizations to a more manageable format
reduced <- reduceRandomizations(rawResults)

#calculate the observed metrics from the input CDM
observed <- observedMetrics(tree, cdm, metrics=c("richness","NAW_MPD"))

#summarize the means, SD and CI of the randomizations
summarized <- lapply(reduced, summaries, concat.by="richness")

#merge the observations and the summarized randomizations to facilitate significance
#testing
merged <- lapply(summarized, merge, observed)

#calculate the standardized scores of each observed metric as compared to the richness
#null model randomization.
plotTest(merged$richness, "richness")

#do the same as above but across all null models
#temp <- lapply(1:length(merged), function(x) plotTest(merged[[x]], "richness"))



