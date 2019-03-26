library(cernn)


### Name: get_alpha
### Title: Compute alpha parameter for covariance regularization.
### Aliases: get_alpha

### ** Examples

n <- 10
p <- 5
set.seed(12345)
X <- matrix(rnorm(n*p),n,p)
get_alpha(X)



