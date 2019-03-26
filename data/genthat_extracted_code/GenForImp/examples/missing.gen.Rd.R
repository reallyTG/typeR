library(GenForImp)


### Name: missing.gen
### Title: Generating random missing values on a data matrix
### Aliases: missing.gen
### Keywords: classes multivariate NA

### ** Examples

sigma <- matrix(0.4, 4, 4)
diag(sigma) <- 1
x0 <- rmvnorm(n=100, mean=rep(0, 4), sigma=sigma)
x0 # complete matrix
x <- missing.gen(x0, 50)
x # matrix with 50 missing values



