library(clusternomics)


### Name: contextCluster
### Title: Clusternomics: Context-dependent clustering
### Aliases: contextCluster

### ** Examples

# Example with simulated data (see vignette for details)
# Number of elements in each cluster
groupCounts <- c(50, 10, 40, 60)
# Centers of clusters
means <- c(-1.5,1.5)
testData <- generateTestData_2D(groupCounts, means)
datasets <- testData$data

# Fit the model
# 1. specify number of clusters
clusterCounts <- list(global=10, context=c(3,3))
# 2. Run inference
# Number of iterations is just for demonstration purposes, use
# a larger number of iterations in practice!
results <- contextCluster(datasets, clusterCounts,
     maxIter = 10, burnin = 5, lag = 1,
     dataDistributions = 'diagNormal',
     verbose = TRUE)

# Extract results from the samples
# Final state:
state <- results$samples[[length(results$samples)]]
# 1) assignment to global clusters
globalAssgn <- state$Global
# 2) context-specific assignmnets- assignment in specific dataset (context)
contextAssgn <- state[,"Context 1"]
# Assess the fit of the model with DIC
results$DIC




