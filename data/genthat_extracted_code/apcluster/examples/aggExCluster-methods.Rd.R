library(apcluster)


### Name: aggExCluster
### Title: Exemplar-based Agglomerative Clustering
### Aliases: aggExCluster aggexcluster aggExCluster-methods
###   aggExCluster,matrix,missing-method aggExCluster,matrix,ExClust-method
###   aggExCluster,Matrix,missing-method aggExCluster,Matrix,ExClust-method
###   aggExCluster,missing,ExClust-method aggExCluster,function,ANY-method
###   aggExCluster,character,ANY-method
### Keywords: cluster methods

### ** Examples

## create two Gaussian clouds
cl1 <- cbind(rnorm(50, 0.2, 0.05), rnorm(50, 0.8, 0.06))
cl2 <- cbind(rnorm(50, 0.7, 0.08), rnorm(50, 0.3, 0.05))
x <- rbind(cl1, cl2)

## compute agglomerative clustering from scratch
aggres1 <- aggExCluster(negDistMat(r=2), x)

## show results
show(aggres1)

## plot dendrogram
plot(aggres1)

## plot heatmap along with dendrogram
heatmap(aggres1)

## plot level with two clusters
plot(aggres1, x, k=2)

## run affinity propagation
apres <- apcluster(negDistMat(r=2), x, q=0.7)

## create hierarchy of clusters determined by affinity propagation
aggres2 <- aggExCluster(x=apres)

## show results
show(aggres2)

## plot dendrogram
plot(aggres2)
plot(aggres2, showSamples=TRUE)

## plot heatmap
heatmap(aggres2)

## plot level with two clusters
plot(aggres2, x, k=2)



