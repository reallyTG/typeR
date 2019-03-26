library(anocva)


### Name: nClustMulti
### Title: Multiple Samples Optimal Number of Clusters Estimation
### Aliases: nClustMulti

### ** Examples

# Install packages if necessary
# install.packages('MASS')
# install.packages('cluster')

library(anocva)
library(MASS)
library(cluster)

set.seed(5000)

# A k-means function that returns cluster labels directly.
myKmeans = function(dist, k){
  return(kmeans(dist, k, iter.max = 50, nstart = 5)$cluster)
}

# Number of subjects in each population
nsub = 25
# Number of items in each subject
nitem = 60

# Generate simulated data
data = array(NA, c(nsub, nitem*2, 2))
data.dist = array(NA, c(nsub, nitem*2, nitem*2))
meanx = 2
delta = 0.5
# Covariance matrix
sigma = matrix(c(0.03, 0, 0, 0.03), 2)
for (i in seq(nsub)){
  sub = rbind(mvrnorm(nitem, mu = c(0, 0), Sigma = sigma ),
              mvrnorm(nitem, mu = c(meanx,0), Sigma = sigma))
  data[i,,] = sub
  data.dist[i,,] = as.matrix(dist(data[i,,]))
}

# Estimate the optimal number of clusters
r = nClustMulti(dataDist = data.dist, p = 1, maxClust = 20,
                clusteringFunction = myKmeans, criterion = "slope")
sprintf("The optimal number of clusters found was %d.", r)




