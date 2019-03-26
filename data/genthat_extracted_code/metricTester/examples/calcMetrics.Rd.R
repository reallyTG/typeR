library(metricTester)


### Name: calcMetrics
### Title: Calculate phylogenetic community structure metrics
### Aliases: calcMetrics

### ** Examples

#simulate tree with birth-death process
tree <- geiger::sim.bdtree(b=0.1, d=0, stop="taxa", n=50)

sim.abundances <- round(rlnorm(5000, meanlog=2, sdlog=1))

cdm <- simulateComm(tree, richness.vector=10:25, abundances=sim.abundances)

prepped <- prepData(tree, cdm)

results <- calcMetrics(prepped)

#an example of how to only calculate a subset of pre-defined metrics
results2 <- calcMetrics(prepped, metrics=c("richness","NAW_MPD"))

#an example of how to define ones own metrics for use in the metricTester framework
#this "metric" simply calculates the richness of each plot in the CDM
exampleMetric <- function(metrics.input)
{
output <- apply(metrics.input$picante.cdm, 1, lengthNonZeros)
output
}

calcMetrics(prepped, metrics=list("richness"=metricTester:::my_richness,
"example"=exampleMetric), new_=TRUE)



