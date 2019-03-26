library(sparseMVN)


### Name: rmvn.sparse
### Title: Multivariate normal functions with sparse covariance/precision
###   matrix.
### Aliases: rmvn.sparse dmvn.sparse dmvn.sparse

### ** Examples

   require(Matrix)
   m <- 20
   p <- 2
   k <- 4

## build sample sparse covariance matrix
   Q1 <- tril(kronecker(Matrix(seq(0.1,p,length=p*p),p,p),diag(m)))
   Q2 <- cbind(Q1,Matrix(0,m*p,k))
   Q3 <- rbind(Q2,cbind(Matrix(rnorm(k*m*p),k,m*p),Diagonal(k)))
   V <- tcrossprod(Q3)
   CH <- Cholesky(V)

   x <- rmvn.sparse(10,rep(0,p*m+k),CH, FALSE)
   y <- dmvn.sparse(x[1,],rep(0,p*m+k), CH, FALSE)




