library(anocva)


### Name: anocva
### Title: ANalysis Of Cluster VAriability
### Aliases: anocva

### ** Examples


# Install packages if necessary
# install.packages('MASS')
# install.packages('cluster')

library(anocva)
library(MASS)
library(cluster)

set.seed(5000)

# Defines a k-means function that returns cluster labels directly
myKmeans = function(dist, k){
  return(kmeans(dist, k, iter.max = 50, nstart = 5)$cluster)
}

# Number of subjects in each population
nsub = 20
# Number of items in each subject
nitem = 30

# Generate simulated data
data = array(NA, c(nsub*2, nitem*2, 2))
dataDist = array(NA, c(nsub*2, nitem*2, nitem*2))
meanx = 2
delta = 0.5
# Covariance matrix
sigma = matrix(c(0.03, 0, 0, 0.03), 2)
for (i in seq(nsub*2)){
  sub = rbind(mvrnorm(nitem, mu = c(0, 0), Sigma = sigma ),
              mvrnorm(nitem, mu = c(meanx,0), Sigma = sigma))
  data[i,,] = sub
  # If it's a sample of population 2.
  if (i > nsub){
    data[i,10,1] = data[i,10,1] + delta
  }
  # Euclidian distance
  dataDist[i,,] = as.matrix(dist(data[i,,]))
}

# Population 1 subject
plot(data[5,,], asp = 1, xlab = '', ylab = '', main = 'Population 1 - subject example')

# Population 2 subject
plot(data[35,,], asp = 1, xlab = '', ylab = '', main = 'Population 2 - subject example')

# The first nsub subjects belong to population 1 while the next nsub subjects belong to population 2
id = c(rep(1, nsub), rep(2, nsub))

## Not run: 
##D # ANOCVA call with different clustering function (myKmeans) and inside estimation of
##D # the number of clusters (r)
##D res1 = anocva(dataDist, id, replicates=500, r = NULL,
##D               clusteringFunction = myKmeans,
##D               p = 1, criterion = "slope")
## End(Not run)

# Estimate the number of clusters previously by using Spectral Clustering and Slope criterion
r = nClustMulti(dataDist, clusteringFunction = spectralClustering, criterion = 'slope')

# Calls ANOCVA statistical test
res = anocva(dataDist, id, replicates=500, r = r,
             clusteringFunction = spectralClustering,
             p = 1, criterion = "slope")

# DeltaS p-value
res$pValueDeltaS

# DeltaSq p-values
res$pValueDeltaSq

# Identifies which items have significant p-values with a significance level of 0.05.
which(res$pValueDeltaSq < 0.05)

# Identifies which items have significant FDR adjusted p-values (q-values)
# with a significance level of 0.05.
qValue = p.adjust(res$pValueDeltaSq, "fdr")
which(qValue < 0.05)




