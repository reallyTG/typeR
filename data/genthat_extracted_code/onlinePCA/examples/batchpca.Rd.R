library(onlinePCA)


### Name: batchpca
### Title: Batch PCA
### Aliases: batchpca

### ** Examples


## Not run: 
##D ## Simulate data
##D n <- 1e4
##D d <- 500
##D q <- 10
##D x <- matrix(runif(n*d), n, d)
##D x <- x %*% diag(sqrt(12*(1:d)))
##D # The eigenvalues of cov(x) are approximately 1, 2, ..., d
##D # and the corresponding eigenvectors are approximately  
##D # the canonical basis of R^p
##D 
##D ## PCA computation (from fastest to slowest)
##D system.time(pca1 <- batchpca(scale(x,scale=FALSE), q, byrow=TRUE))
##D system.time(pca2 <- batchpca(cov(x), q, type="covariance"))
##D system.time(pca3 <- eigen(cov(x),TRUE))
##D system.time(pca4 <- svd(scale(x/sqrt(n-1),scale=FALSE), 0, q))
##D system.time(pca5 <- prcomp(x))
## End(Not run)



