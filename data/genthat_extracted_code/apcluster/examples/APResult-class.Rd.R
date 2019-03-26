library(apcluster)


### Name: APResult-class
### Title: Class "APResult"
### Aliases: APResult-class APResult apresult similarity
###   [,APResult,index,missing,missing-method
###   [[,APResult,index,missing-method length,APResult-method
###   similarity,APResult-method
### Keywords: classes

### ** Examples

## create two Gaussian clouds
cl1 <- cbind(rnorm(100, 0.2, 0.05), rnorm(100, 0.8, 0.06))
cl2 <- cbind(rnorm(50, 0.7, 0.08), rnorm(50, 0.3, 0.05))
x <- rbind(cl1, cl2)

## compute similarity matrix (negative squared Euclidean)
sim <- negDistMat(x, r=2)

## run affinity propagation
apres <- apcluster(sim, details=TRUE)

## show details of clustering results
show(apres)

## plot information about clustering run
plot(apres)

## plot clustering result
plot(apres, x)

## plot heatmap
heatmap(apres, sim)



