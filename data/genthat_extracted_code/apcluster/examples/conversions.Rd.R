library(apcluster)


### Name: conversions
### Title: Conversions Between Dense and Sparse Similarity Matrices
### Aliases: conversions as.SparseSimilarityMatrix as.DenseSimilarityMatrix
###   as.SparseSimilarityMatrix-methods as.DenseSimilarityMatrix-method
###   as.SparseSimilarityMatrix,matrix-method
###   as.DenseSimilarityMatrix,matrix-method
###   as.SparseSimilarityMatrix,sparseMatrix-method
###   as.DenseSimilarityMatrix,sparseMatrix-method
###   as.SparseSimilarityMatrix,Matrix-method
###   as.DenseSimilarityMatrix,Matrix-method
### Keywords: cluster

### ** Examples

## create similarity matrix in sparse format according to Frey and Dueck
sp <- matrix(c(1, 2, 0.5, 3, 1, 0.2, 5, 4, -0.2, 3, 4, 1.2), 4, 3, byrow=TRUE)
sp

## perform conversions
as.DenseSimilarityMatrix(sp, fill=0)
as.SparseSimilarityMatrix(sp)

## create dense similarity matrix
cl1 <- cbind(rnorm(20, 0.2, 0.05), rnorm(20, 0.8, 0.06))
cl2 <- cbind(rnorm(20, 0.7, 0.08), rnorm(20, 0.3, 0.05))
x <- rbind(cl1, cl2)

sim <- negDistMat(x, r=2)
ssim <- as.SparseSimilarityMatrix(sim, lower=-0.2)

## run apcluster() on the sparse similarity matrix
apres <- apcluster(ssim, q=0)
apres



