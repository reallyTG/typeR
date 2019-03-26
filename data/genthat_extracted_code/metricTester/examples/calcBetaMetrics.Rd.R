library(metricTester)


### Name: calcBetaMetrics
### Title: Calculate phylogenetic community structure beta metrics
### Aliases: calcBetaMetrics

### ** Examples

#simulate tree with birth-death process
tree <- geiger::sim.bdtree(b=0.1, d=0, stop="taxa", n=50)

sim.abundances <- round(rlnorm(5000, meanlog=2, sdlog=1))

cdm <- simulateComm(tree, richness.vector=10:25, abundances=sim.abundances)

prepped <- prepData(tree, cdm)

results <- calcBetaMetrics(prepped)

#an example of how to define ones own metrics for use in the metricTester framework
#this "metric" simply calculates the richness of each plot in the CDM
exampleMetric <- function(metrics.input)
{
output <- mean(apply(metrics.input$picante.cdm, 1, lengthNonZeros))
output
}

calcBetaMetrics(prepped, metrics=list("example"=exampleMetric), new_=TRUE)



