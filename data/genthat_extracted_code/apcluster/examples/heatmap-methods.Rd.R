library(apcluster)


### Name: heatmap
### Title: Plot Heatmap
### Aliases: heatmap heatmap-methods heatmap,ExClust,missing-method
###   heatmap,ExClust,matrix-method heatmap,ExClust,Matrix-method
###   heatmap,ExClust,sparseMatrix-method
###   heatmap,AggExResult,missing-method heatmap,AggExResult,matrix-method
###   heatmap,missing,matrix-method heatmap,matrix,missing-method
### Keywords: cluster methods

### ** Examples

## create two Gaussian clouds
cl1 <- cbind(rnorm(50, 0.2, 0.05), rnorm(50, 0.8, 0.06))
cl2 <- cbind(rnorm(50, 0.7, 0.08), rnorm(50, 0.3, 0.05))
x <- rbind(cl1, cl2)

## run affinity propagation using negative squared Euclidean
apres <- apcluster(negDistMat(r=2), x, p=-0.1)

## plot heatmap clustering run
heatmap(apres)

## rerun affinity propagation
## reuse similarity matrix from previous run
apres2 <- apcluster(s=apres@sim, q=0.6)

## plot heatmap of second run
heatmap(apres2, apres@sim)

## with alternate heatmap coloring, alternating color bars, and no dendrograms
heatmap(apres2, apres@sim, Rowv=NA, Colv=NA,
        sideColors=c("darkgreen", "yellowgreen"), col=terrain.colors(12))

## perform agglomerative clustering of affinity propagation clusters
aggres1 <- aggExCluster(apres@sim, apres2)

## plot heatmap
heatmap(cutree(aggres1, 2), apres@sim)

## perform agglomerative clustering of whole data set
aggres2 <- aggExCluster(negDistMat(r=2), x)

## show heatmap along with dendrogram
heatmap(aggres2)



