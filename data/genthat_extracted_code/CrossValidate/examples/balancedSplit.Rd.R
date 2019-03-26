library(CrossValidate)


### Name: balancedSplit
### Title: Split a dataset into training and testing sets, balancing a
###   factor
### Aliases: balancedSplit
### Keywords: classif

### ** Examples

nFeatures <- 40
nSamples <- 2*10
dataset <- matrix(rnorm(nSamples*nFeatures), ncol=nSamples)
groups <- factor(rep(c("A", "B"), each=10))
balancedSplit(dataset, groups)



