library(BlockCov)


### Name: Sigma_estimation
### Title: This function computes an estimator of the covariance matrix and
###   the square root of its inverse and permutes its rows and columns if
###   it is necessary to make the block structure appear.
### Aliases: Sigma_estimation

### ** Examples

n <- 30
q <- 100
Sigma <- Simu_Sigma(q = q, diag = FALSE, equal = TRUE)
Matrix::image(Sigma)
E <- matrix(rnorm(n * q), ncol = q) %*% chol(as.matrix(Sigma))
res <- Sigma_estimation(E, prop.max = 0.6, step =500)
Matrix::image(res$Sigma_est)
Matrix::image(res$S_inv_12)



