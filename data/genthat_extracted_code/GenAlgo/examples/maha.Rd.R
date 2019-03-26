library(GenAlgo)


### Name: maha
### Title: Compute the (squared) Mahalanobis distance between two groups of
###   vectors
### Aliases: maha
### Keywords: multivariate

### ** Examples

nFeatures <- 40
nSamples <- 2*10
dataset <- matrix(rnorm(nSamples*nFeatures), ncol=nSamples)
groups <- factor(rep(c("A", "B"), each=10))
maha(dataset, groups)



