library(anocva)


### Name: nClust
### Title: Optimal Number of Clusters Estimation
### Aliases: nClust

### ** Examples

# Install packages if necessary
# install.packages('MASS')
# install.packages('cluster')

library(MASS)
library(cluster)
library(anocva)

set.seed(2000)

# Defines a k-means function that returns cluster labels directly
myKmeans = function(dist, k){
  return(kmeans(dist, k, iter.max = 50, nstart = 5)$cluster)
}

# Generate simulated data
nitem = 70
sigma = matrix(c(0.04, 0, 0, 0.04), 2)
simuData = rbind(mvrnorm(nitem, mu = c(0, 0), Sigma = sigma ),
             mvrnorm(nitem, mu = c(3,0), Sigma = sigma),
             mvrnorm(nitem, mu = c(2.5,2), Sigma = sigma))

plot(simuData, asp = 1, xlab = '', ylab = '', main = 'Data for clustering')

# Calculate distances and perform {0,1} normalization
distMatrix = as.matrix(dist(simuData))
distMatrix = checkRange01(distMatrix)

# Estimate the optimal number of clusters
r = nClust(meanDist = distMatrix, p = 1, maxClust = 10,
           clusteringFunction = myKmeans, criterion = "silhouette")
sprintf("The optimal number of clusters found was %d.", r)

# K-means Clustering
labels = myKmeans(distMatrix, r)

plot(simuData, col = labels, asp = 1, xlab = '', ylab = '', main = 'K-means clustered data')




