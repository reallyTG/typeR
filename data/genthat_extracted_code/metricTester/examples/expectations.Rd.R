library(metricTester)


### Name: expectations
### Title: Generate expectations for null+metric combinations
### Aliases: expectations

### ** Examples

#simulate tree with birth-death process
tree <- geiger::sim.bdtree(b=0.1, d=0, stop="taxa", n=50)

#simulate a log normal abundance distribution
sim.abundances <- round(rlnorm(5000, meanlog=2, sdlog=1)) + 1

#simulate a community of varying richness
cdm <- simulateComm(tree, richness.vector=10:13, abundances=sim.abundances)

#below not run for timing issues on CRAN
test <- expectations(picante.cdm=cdm, tree=tree, optional.dists=NULL,
regional.abundance=NULL, distances.among=NULL, randomizations=3, cores="seq",
nulls="richness", metrics=c("richness", "NAW_MPD"),
concat.by="both", output.raw=FALSE)

#an example of how to explore behavior of a new metric in the metricTester framework
#this "metric" simply calculates the richness of each plot in the CDM
exampleMetric <- function(metrics.input)
{
output <- apply(metrics.input$picante.cdm, 1, lengthNonZeros)
output
}

#test2 <- expectations(picante.cdm=cdm, tree=tree, optional.dists=NULL,
#regional.abundance=NULL, distances.among=NULL, randomizations=3, cores=1,
#nulls="frequency", 
#metrics=list("richness"=metricTester:::my_richness, "exampleMetric"=exampleMetric),
#concat.by="both", output.raw=FALSE)



