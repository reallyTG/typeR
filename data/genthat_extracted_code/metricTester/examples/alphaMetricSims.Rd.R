library(metricTester)


### Name: alphaMetricSims
### Title: Calculate alpha metrics under specified tree and community
###   parameters
### Aliases: alphaMetricSims

### ** Examples

test <- alphaMetricSims(tree.size=50, richness.vector=30:40, delta=1,
abundances=round(rlnorm(5000, meanlog=2, sdlog=1)) + 1) 



