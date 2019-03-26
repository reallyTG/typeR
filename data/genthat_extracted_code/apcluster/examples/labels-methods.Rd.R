library(apcluster)


### Name: labels-methods
### Title: Generate label vector from clustering result
### Aliases: labels labels-methods labels,APResult-method
###   labels,ExClust-method
### Keywords: cluster methods

### ** Examples

## create two simple clusters
x <- c(1, 2, 3, 7, 8, 9)
names(x) <- c("a", "b", "c", "d", "e", "f")

## compute similarity matrix (negative squared distance)
sim <- negDistMat(x, r=2)

## run affinity propagation
apres <- apcluster(sim)

## show details of clustering results
show(apres)

## label vector (names of exemplars)
labels(apres)

## label vector (consecutive index of exemplars)
labels(apres, type="enum")

## label vector (index of exemplars within original data set)
labels(apres, type="exemplars")

## now with agglomerative clustering
aggres <- aggExCluster(sim)

## label (names of exemplars)
labels(cutree(aggres, 2))



