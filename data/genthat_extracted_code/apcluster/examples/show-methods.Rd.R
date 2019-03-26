library(apcluster)


### Name: show-methods
### Title: Display Clustering Result Objects
### Aliases: show show-methods show,APResult-method show,ExClust-method
###   show,AggExResult-method
### Keywords: cluster methods

### ** Examples

## create two Gaussian clouds
cl1 <- cbind(rnorm(100, 0.2, 0.05), rnorm(100, 0.8, 0.06))
cl2 <- cbind(rnorm(50, 0.7, 0.08), rnorm(50, 0.3, 0.05))
x <- rbind(cl1, cl2)

## compute similarity matrix (negative squared Euclidean)
sim <- negDistMat(x, r=2)

## run affinity propagation
apres <- apcluster(sim)

## show details of clustering results
show(apres)

## apply agglomerative clustering to apres
aggres <- aggExCluster(sim, apres)

## display overview of result
show(aggres)

## show clustering level with two clusters
show(cutree(aggres, 2))



