library(cernn)


### Name: get_lambda_max
### Title: Compute lambda_max parameter for covariance regularization.
### Aliases: get_lambda_max

### ** Examples

n <- 10
p <- 5
set.seed(12345)
X <- matrix(rnorm(n*p),n,p)
d <- svd(X)$d**2
alpha <- get_alpha(X)
get_lambda_max(d,alpha,n)



