library(metricTester)


### Name: betaMetricSims
### Title: Calculate beta metrics under specified tree and community
###   parameters
### Aliases: betaMetricSims

### ** Examples

test <- betaMetricSims(tree.size=50, richness.vector=30:40, delta=1,
abundances=round(rlnorm(5000, meanlog=2, sdlog=1)) + 1, beta.iterations=10)



