library(qlcMatrix)


### Name: unfoldBlockMatrix
### Title: Unfolding of block matrices (sparse matrices)
### Aliases: unfoldBlockMatrix

### ** Examples

# specially prepared block matrix. For illustration purpuse, this one is not sparse
( X <- Matrix( c( rep(c(1,1,1,1,2,2,3,3,3,4),3),
		rep(c(5,5,5,5,6,6,7,7,7,8),2)),10,5, sparse = TRUE) )

# this matrix has two column groups, and four row groups
# groups can be specified as sparse matrices, or as grouping vectors
colG <- ttMatrix(c(1,1,1,2,2))$M*1
rowG <- ttMatrix(c(1,1,1,1,2,2,3,3,3,4))$M*1

# unfold the matrix, with the result that each block has it's own rows/columns
# the $L and $R matrices can be used to refold the matrix to it's original state
( M <- unfoldBlockMatrix(X, colG, rowG) )

# unfold and refold back: result is identical with M
with(M, all.equal(X, L %*% U %*% R) )

# Unfolded, each block can be easily reached for computations using diagonal matrices
# for example, multiply each block by the sum of its cells, and then fold back again
# this is a trick to apply computations to blocks in sparse block matrices
sums <- drop(crossprod(kronecker(Diagonal(nrow(colG)),rowG)) %*% rowSums(M$U))
S <- Diagonal( x = sums )

with(M, L %*% S %*% U %*% R )



