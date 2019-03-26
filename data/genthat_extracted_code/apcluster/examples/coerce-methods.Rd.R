library(apcluster)


### Name: coerce-methods
### Title: Coercion of cluster hierarchies
### Aliases: as.hclust as.dendrogram as.hclust,AggExResult-method
###   as.hclust,ExClust-method as.dendrogram,AggExResult-method
###   as.dendrogram,ExClust-method
### Keywords: cluster methods

### ** Examples

## create two Gaussian clouds
cl1 <- cbind(rnorm(20, 0.2, 0.05), rnorm(20, 0.8, 0.06))
cl2 <- cbind(rnorm(20, 0.7, 0.08), rnorm(20, 0.3, 0.05))
x <- rbind(cl1, cl2)

## run affinity propagation
apres <- apcluster(negDistMat(r=2), x, q=0.7, details=TRUE)

## perform agglomerative clustering of affinity propagation clusters
aggres1 <- aggExCluster(x=apres)

## compute and plot dendrogram
dend1 <- as.dendrogram(aggres1)
dend1
plot(dend1)

## compute and show dendrogram computed from hclust object
dend2 <- as.dendrogram(as.hclust(aggres1))
dend2
plot(dend2)

## perform agglomerative clustering of whole data set
aggres2 <- aggExCluster(negDistMat(r=2), x)

## compute and plot dendrogram
dend3 <- as.dendrogram(aggres2)
dend3
plot(dend3)



