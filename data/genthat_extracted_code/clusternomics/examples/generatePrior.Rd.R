library(clusternomics)


### Name: generatePrior
### Title: Generate a basic prior distribution for the datasets.
### Aliases: generatePrior

### ** Examples

# Example with simulated data (see vignette for details)
nContexts <- 2
# Number of elements in each cluster
groupCounts <- c(50, 10, 40, 60)
# Centers of clusters
means <- c(-1.5,1.5)
testData <- generateTestData_2D(groupCounts, means)
datasets <- testData$data

# Generate the prior
fullDataDistributions <- rep('diagNormal', nContexts)
prior <- generatePrior(datasets, fullDataDistributions, 0.01, 0.1)

# Fit the model
# 1. specify number of clusters
clusterCounts <- list(global=10, context=c(3,3))
# 2. Run inference
# Number of iterations is just for demonstration purposes, use
# a larger number of iterations in practice!
results <- contextCluster(datasets, clusterCounts,
     maxIter = 10, burnin = 5, lag = 1,
     dataDistributions = 'diagNormal', prior = prior,
     verbose = TRUE)





