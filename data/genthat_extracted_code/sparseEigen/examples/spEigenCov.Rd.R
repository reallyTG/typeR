library(sparseEigen)


### Name: spEigenCov
### Title: Covariance Matrix Estimation with Sparse Eigenvectors
### Aliases: spEigenCov

### ** Examples

## Not run: 
##D library(sparseEigen)
##D n <- 600  # samples
##D m <- 500  # dimension
##D q <- 3  # number of sparse eigenvectors to be estimated
##D sp_card <- 0.1*m  # sparsity of each eigenvector
##D 
##D # generate covariance matrix with sparse eigenvectors
##D V <- matrix(0, m, q)
##D V[cbind(seq(1, q*sp_card), rep(1:q, each = sp_card))] <- 1/sqrt(sp_card)
##D V <- cbind(V, matrix(rnorm(m*(m-q)), m, m-q))
##D V <- qr.Q(qr(V))  # orthogonalize eigenvectors
##D lmd <- c(100*seq(from = q, to = 1), rep(1, m-q))  # generate eigenvalues
##D R <- V %*% diag(lmd) %*% t(V)  # covariance matrix
##D 
##D # generate data
##D X <- MASS::mvrnorm(n, rep(0, m), R)  # random data with underlying sparse structure
##D 
##D # standard and sparse estimation
##D res_standard <- eigen(cov(X))
##D res_sparse <- spEigenCov(cov(X), q)
##D 
##D # show inner product between estimated eigenvectors and originals (the closer to 1 the better)
##D abs(diag(t(res_standard$vectors) %*% V[, 1:q]))  #for standard estimated eigenvectors
##D abs(diag(t(res_sparse$vectors) %*% V[, 1:q]))    #for sparse estimated eigenvectors
##D 
##D # show error between estimated and true covariance
##D norm(cov(X) - R, type = 'F') #for sample covariance matrix
##D norm(res_sparse$cov - R, type = 'F') #for covariance with sparse eigenvectors
## End(Not run)



