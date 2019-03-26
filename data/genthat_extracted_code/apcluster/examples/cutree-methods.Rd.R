library(apcluster)


### Name: cutree-methods
### Title: Cut Out Clustering Level from Cluster Hierarchy
### Aliases: cutree cutree-methods cutree,AggExResult-method
###   cutree,APResult-method
### Keywords: cluster methods

### ** Examples

## create two simple clusters
x <- c(1, 2, 3, 7, 8, 9)
names(x) <- c("a", "b", "c", "d", "e", "f")

## compute similarity matrix (negative squared distance)
sim <- negDistMat(x, r=2)

## run affinity propagation
aggres <- aggExCluster(sim)

## show details of clustering results
show(aggres)

## retrieve clustering with 2 clusters
cutree(aggres, 2)

## retrieve clustering with cut-off h=-1
cutree(aggres, h=-1)



