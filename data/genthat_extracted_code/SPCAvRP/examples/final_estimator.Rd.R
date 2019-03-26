library(SPCAvRP)


### Name: final_estimator
### Title: Computes the leading eigenvector from its support
### Aliases: final_estimator

### ** Examples

p <- 80
k <- 8
n <- 1000
v1 <- c(rep(1/sqrt(k), k), rep(0,p-k))
Sigma <- 2*tcrossprod(v1) + diag(p)
mu <- rep(0, p)
X <- mvrnorm(n, mu, Sigma)
Sigma_hat <- 1/n*crossprod(X)

A <- 200
B <- 100
d <- 10

rand_ind <- matrix(replicate(A*B,sample.int(p,d)), nrow = A*B, byrow = TRUE)
cov_projections <- project_covariance(data = Sigma_hat, cov = TRUE, rand_ind)
ranking <- SPCAvRP_ranking(cov_projections, rand_ind, p, A)

output <- final_estimator(data = Sigma_hat, cov = TRUE, l = (5:11), ranking)
df <- data.frame(5:11,output$value); colnames(df) <- c('l','eigenvalue')
print(df)



