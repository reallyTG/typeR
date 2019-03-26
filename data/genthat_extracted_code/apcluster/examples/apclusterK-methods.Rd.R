library(apcluster)


### Name: apclusterK
### Title: Affinity Propagation for Pre-defined Number of Clusters
### Aliases: apclusterK apclusterK-methods apclusterK,matrix,missing-method
###   apclusterK,Matrix,missing-method apclusterK,dgTMatrix,missing-method
###   apclusterK,sparseMatrix,missing-method
###   apclusterK,character,ANY-method apclusterK,function,ANY-method
### Keywords: cluster

### ** Examples

## create three Gaussian clouds
cl1 <- cbind(rnorm(70, 0.2, 0.05), rnorm(70, 0.8, 0.06))
cl2 <- cbind(rnorm(50, 0.7, 0.08), rnorm(50, 0.3, 0.05))
cl3 <- cbind(rnorm(60, 0.8, 0.04), rnorm(60, 0.8, 0.05))
x <- rbind(cl1, cl2, cl3)

## run affinity propagation such that 3 clusters are obtained
apres <- apclusterK(negDistMat(r=2), x, K=3)

## show details of clustering results
show(apres)

## plot clustering result
plot(apres, x)

## create sparse similarity matrix
cl1 <- cbind(rnorm(20, 0.2, 0.05), rnorm(20, 0.8, 0.06))
cl2 <- cbind(rnorm(20, 0.7, 0.08), rnorm(20, 0.3, 0.05))
x <- rbind(cl1, cl2)

sim <- negDistMat(x, r=2)
ssim <- as.SparseSimilarityMatrix(sim, lower=-0.2)

## run apcluster() on the sparse similarity matrix
apres <- apclusterK(ssim, K=2)
apres



