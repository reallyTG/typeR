library(randomUniformForest)


### Name: modifyClusters
### Title: Change number of clusters (and clusters shape) on the fly
### Aliases: modifyClusters
### Keywords: unsupervised learning clustering dimension reduction

### ** Examples

## not run
## load iris data
# data(iris)

## run unsupervised modelling, removing labels and committing 4 clusters
# iris.rufUnsupervised = unsupervised.randomUniformForest(iris[,-5], threads = 1, clusters = 4)

## view a summary
# iris.rufUnsupervised

## plot clusters 
# plot(iris.rufUnsupervised)

## modify clusters, decreasing them by  one
# iris.rufUnsupervisedNew = modifyClusters(iris.rufUnsupervised, decreaseBy = 1)

## assess fitting comparing average Silhouette before and after
# iris.rufUnsupervisedNew

## plot to see the new clusters
# plot(iris.rufUnsupervisedNew) 



