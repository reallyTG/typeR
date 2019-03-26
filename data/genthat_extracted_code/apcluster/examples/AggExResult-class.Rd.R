library(apcluster)


### Name: AggExResult-class
### Title: Class "AggExResult"
### Aliases: AggExResult-class AggExResult aggexresult
###   [,AggExResult,index,missing,missing-method
###   [[,AggExResult,index,missing-method length,AggExResult-method
###   similarity,AggExResult-method
### Keywords: classes

### ** Examples

## create two Gaussian clouds
cl1 <- cbind(rnorm(50, 0.2, 0.05), rnorm(50, 0.8, 0.06))
cl2 <- cbind(rnorm(50, 0.7, 0.08), rnorm(50, 0.3, 0.05))
x <- rbind(cl1, cl2)

## compute similarity matrix (negative squared Euclidean)
sim <- negDistMat(x, r=2)

## compute agglomerative clustering from scratch
aggres1 <- aggExCluster(sim)

## show results
show(aggres1)

## plot dendrogram
plot(aggres1)

## plot heatmap along with dendrogram
heatmap(aggres1, sim)

## plot level with two clusters
plot(aggres1, x, k=2)

## run affinity propagation
apres <- apcluster(sim, q=0.7)

## create hierarchy of clusters determined by affinity propagation
aggres2 <- aggExCluster(sim, apres)

## show results
show(aggres2)

## plot dendrogram
plot(aggres2)

## plot heatmap
heatmap(aggres2, sim)

## plot level with two clusters
plot(aggres2, x, k=2)



