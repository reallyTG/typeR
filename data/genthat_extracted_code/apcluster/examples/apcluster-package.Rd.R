library(apcluster)


### Name: apcluster-package
### Title: APCluster Package
### Aliases: apcluster-package
### Keywords: package

### ** Examples

## create two Gaussian clouds
cl1 <- cbind(rnorm(100, 0.2, 0.05), rnorm(100, 0.8, 0.06))
cl2 <- cbind(rnorm(100, 0.7, 0.08), rnorm(100, 0.3, 0.05))
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

## employ agglomerative clustering to join clusters
aggres <- aggExCluster(sim, apres)

## show information
show(aggres)
show(cutree(aggres, 2))

## plot dendrogram
plot(aggres)

## plot clustering result for k=2 clusters
plot(aggres, x, k=2)

## plot heatmap
heatmap(apres, sim)

## leveraged apcluster
apresL <- apclusterL(s=negDistMat(r=2), x=x,  frac=0.2, sweeps=3)

## show details of clustering results
show(apresL)

## plot clustering result
plot(apresL, x)



