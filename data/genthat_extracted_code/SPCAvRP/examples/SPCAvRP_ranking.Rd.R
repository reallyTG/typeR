library(SPCAvRP)


### Name: SPCAvRP_ranking
### Title: Ranks the variables
### Aliases: SPCAvRP_ranking

### ** Examples

p <-  50 # dimension of data
k <- 5 # true sparsity level
n <- 1000 # number of observations
v1 <- c(rep(1/sqrt(k), k), rep(0,p-k)) # leading eigenvector
Sigma <- tcrossprod(v1) + diag(p) # population covariance
mu <- rep(0, p) # population mean
X <- mvrnorm(n, mu, Sigma) # data matrix
Sigma_hat <- 1/n*crossprod(X) # sample covariance matrix

A <- 200 # number of projections over which to aggregate
B <- 100 # number of projections in a group from which to select
d <- k # dimension of projections
rand_ind <- matrix(replicate(A*B,sample.int(p,d)), nrow = A*B, byrow = TRUE) # random projections

cov_projections <- project_covariance(data = Sigma_hat, cov = TRUE, rand_ind)

ranking <- SPCAvRP_ranking(cov_projections, rand_ind, p, A)
print(ranking)



