library(SPCAvRP)


### Name: project_covariance
### Title: Projects the sample covariance
### Aliases: project_covariance

### ** Examples

p <-  50 # dimension of data
k <- 5 # sparsity level
n <- 1000 # number of observations
v1 <- c(rep(1/sqrt(k), k), rep(0,p-k))
Sigma_hat <- 1/n*crossprod(mvrnorm(n, rep(0,p), tcrossprod(v1)+diag(p)))

N <- 1000 # number of projections
d <- k # dimension of projections
rand_ind <- matrix(replicate(N,sample.int(p,d)), nrow = N, byrow = TRUE) # axis-aligned projections

cov_projections <- project_covariance(data = Sigma_hat, cov = TRUE, rand_ind)



