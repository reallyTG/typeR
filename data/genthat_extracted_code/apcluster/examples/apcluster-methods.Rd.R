library(apcluster)


### Name: apcluster
### Title: Affinity Propagation
### Aliases: apcluster apcluster-methods apcluster,matrix,missing-method
###   apcluster,dgTMatrix,missing-method
###   apcluster,sparseMatrix,missing-method apcluster,Matrix,missing-method
###   apcluster,character,ANY-method apcluster,function,ANY-method
### Keywords: cluster methods

### ** Examples

## create two Gaussian clouds
cl1 <- cbind(rnorm(100, 0.2, 0.05), rnorm(100, 0.8, 0.06))
cl2 <- cbind(rnorm(50, 0.7, 0.08), rnorm(50, 0.3, 0.05))
x <- rbind(cl1, cl2)

## compute similarity matrix and run affinity propagation 
## (p defaults to median of similarity)
apres <- apcluster(negDistMat(r=2), x, details=TRUE)

## show details of clustering results
show(apres)

## plot clustering result
plot(apres, x)

## plot heatmap
heatmap(apres)

## run affinity propagation with default preference of 10% quantile
## of similarities; this should lead to a smaller number of clusters
## reuse similarity matrix from previous run
apres <- apcluster(s=apres@sim, q=0.1)
show(apres)
plot(apres, x)

## now try the same with RBF kernel
sim <- expSimMat(x, r=2)
apres <- apcluster(s=sim, q=0.2)
show(apres)
plot(apres, x)

## create sparse similarity matrix
cl1 <- cbind(rnorm(20, 0.2, 0.05), rnorm(20, 0.8, 0.06))
cl2 <- cbind(rnorm(20, 0.7, 0.08), rnorm(20, 0.3, 0.05))
x <- rbind(cl1, cl2)

sim <- negDistMat(x, r=2)
ssim <- as.SparseSimilarityMatrix(sim, lower=-0.2)

## run apcluster() on the sparse similarity matrix
apres <- apcluster(ssim, q=0)
apres



