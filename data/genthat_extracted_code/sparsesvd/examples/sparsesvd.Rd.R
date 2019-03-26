library(sparsesvd)


### Name: sparsesvd
### Title: Singular Value Decomposition of a Sparse Matrix.
### Aliases: sparsesvd

### ** Examples

M <- rbind(
  c(20, 10, 15,  0,  2),
  c(10,  5,  8,  1,  0),
  c( 0,  1,  2,  6,  3),
  c( 1,  0,  0, 10,  5))
M <- Matrix::Matrix(M, sparse=TRUE)
print(M)

res <- sparsesvd(M, rank=2L) # compute first 2 singular components
print(res, digits=3)

M2 <- res$u %*% diag(res$d) %*% t(res$v) # rank-2 approximation
print(M2, digits=1)

print(as.matrix(M) - M2, digits=2) # approximation error



