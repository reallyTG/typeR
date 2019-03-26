library(apcluster)


### Name: ExClust-class
### Title: Class "ExClust"
### Aliases: ExClust-class ExClust exclust
###   [,ExClust,index,missing,missing-method
###   [[,ExClust,index,missing-method length,ExClust-method
###   similarity,ExClust-method
### Keywords: classes

### ** Examples

## create two Gaussian clouds
cl1 <- cbind(rnorm(20, 0.2, 0.05), rnorm(20, 0.8, 0.06))
cl2 <- cbind(rnorm(25, 0.7, 0.08), rnorm(25, 0.3, 0.05))
x <- rbind(cl1, cl2)

## compute similarity matrix (negative squared Euclidean)
sim <- negDistMat(x, r=2)

## run affinity propagation
aggres <- aggExCluster(sim)

## extract level with two clusters
excl <- cutree(aggres, k=2)

## show details of clustering results
show(excl)

## plot information about clustering run
plot(excl, x)



