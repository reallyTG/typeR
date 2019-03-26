library(pgraph)


### Name: projcov
### Title: Calculate the Projected Covariance of Two Vectors
### Aliases: projcov

### ** Examples

library(splines)
set.seed(0)
K = 3
n = 100
b = matrix(rnorm(K*n),n,K)
bx = 1:3
by = c(1,2,2)
x = b%*%bx+rnorm(n)
y = b%*%by+rnorm(n)
fit1 = projcov(x, y, b, method = "lasso")
fit2 = projcov(x, y, b, method = "sam")



