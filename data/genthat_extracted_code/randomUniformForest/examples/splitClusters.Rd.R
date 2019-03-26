library(randomUniformForest)


### Name: splitClusters
### Title: Split a cluster on the fly
### Aliases: splitClusters
### Keywords: unsupervised learning clustering dimension reduction

### ** Examples

## not run
## load iris data
# data(iris)

## run unsupervised modelling, removing labels and committing 2 clusters
# iris.uruf = unsupervised.randomUniformForest(iris[,-5], mtry = 1, nodesize = 2, 
# threads = 1, clusters = 2)

## view a summary
# iris.uruf

## plot clusters 
# plot(iris.uruf)

## split the cluster which has the highest count (cluster 1, in our case)
# iris.urufSplit = splitClusters(iris.uruf, 1)

## assess fitting comparing average Silhouette before and after
# iris.urufSplit

## plot to see the new clusters
# plot(iris.urufSplit) 



