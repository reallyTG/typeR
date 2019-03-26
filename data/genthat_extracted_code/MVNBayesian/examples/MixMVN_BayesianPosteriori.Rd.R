library(MVNBayesian)


### Name: MixMVN_BayesianPosteriori
### Title: Calculate Bayesian posteriori MVN mixture distribution
### Aliases: MixMVN_BayesianPosteriori
### Keywords: Bayesian posteriori MVN mixture distribution

### ** Examples

library(plyr)

# Design matrix should only contain columns of variables
# Export will be a matrix-like data
# Using kmeans (default) clustering algrithm
data_dim <- dataset2[,1:4]
result <- MixMVN_BayesianPosteriori(data=data_dim, species=3)
result

# Get the parameters of the cluster1:
result[1,]

# Get the mixture probability of cluster2:
# (Attention to the difference between
# result[2,1][[1]] and result[2,1])
result[2,1][[1]]

# Get the mean vector of cluster1:
result[1,2][[1]]

# Get the covariance matrix of cluster3:
result[3,3][[1]]



