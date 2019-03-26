library(sparseEigen)


### Name: spEigen
### Title: Sparse Spectral Decomposition of a Matrix
### Aliases: spEigen

### ** Examples

library(sparseEigen)
n <- 100  # samples
m <- 500  # dimension
q <- 3  # number of sparse eigenvectors to be estimated
sp_card <- 0.1*m  # sparsity of each eigenvector

# generate covariance matrix with sparse eigenvectors
V <- matrix(0, m, q)
V[cbind(seq(1, q*sp_card), rep(1:q, each = sp_card))] <- 1/sqrt(sp_card)
V <- cbind(V, matrix(rnorm(m*(m-q)), m, m-q))
V <- qr.Q(qr(V))  # orthogonalize eigenvectors
lmd <- c(100*seq(from = q, to = 1), rep(1, m-q))  # generate eigenvalues
R <- V %*% diag(lmd) %*% t(V)  # covariance matrix

# generate data
X <- MASS::mvrnorm(n, rep(0, m), R)  # random data with underlying sparse structure

# standardand sparse eigenvectors
res_standard <- eigen(cov(X))
res_sparse <- spEigen(cov(X), q)

# show inner product between estimated eigenvectors and originals (the closer to 1 the better)
abs(diag(t(res_standard$vectors) %*% V[, 1:q]))  #for standard estimated eigenvectors
abs(diag(t(res_sparse$vectors) %*% V[, 1:q]))    #for sparse estimated eigenvectors



