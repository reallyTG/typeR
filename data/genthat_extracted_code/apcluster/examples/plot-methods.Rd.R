library(apcluster)


### Name: plot
### Title: Plot Clustering Results
### Aliases: plot plot-methods plot,APResult,missing-method
###   plot,ExClust,missing-method plot,ExClust,matrix-method
###   plot,ExClust,data.frame-method plot,AggExResult,missing-method
###   plot,AggExResult,matrix-method plot,AggExResult,data.frame-method
### Keywords: cluster methods

### ** Examples

## create two Gaussian clouds
cl1 <- cbind(rnorm(50, 0.2, 0.05), rnorm(50, 0.8, 0.06))
cl2 <- cbind(rnorm(50, 0.7, 0.08), rnorm(50, 0.3, 0.05))
x <- rbind(cl1, cl2)

## run affinity propagation
apres <- apcluster(negDistMat(r=2), x, q=0.7, details=TRUE)

## plot information about clustering run
plot(apres)

## plot clustering result
plot(apres, x)

## perform agglomerative clustering of affinity propagation clusters
aggres1 <- aggExCluster(x=apres)

## show dendrograms
plot(aggres1)
plot(aggres1, showSamples=TRUE)

## show clustering result for 4 clusters
plot(aggres1, x, k=4)

## perform agglomerative clustering of whole data set
aggres2 <- aggExCluster(negDistMat(r=2), x)

## show dendrogram
plot(aggres2)

## show heatmap along with dendrogram
heatmap(aggres2)

## show clustering result for 2 clusters
plot(aggres2, x, k=2)

## cluster iris data set
data(iris)
apIris <- apcluster(negDistMat(r=2), iris, q=0)
plot(apIris, iris)



