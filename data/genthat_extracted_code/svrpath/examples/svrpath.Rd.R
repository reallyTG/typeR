library(svrpath)


### Name: svrpath
### Title: Fit the entire regularization path for Support Vector Regression
### Aliases: svrpath

### ** Examples

set.seed(1)
n <- 30
p <- 50

x <- matrix(rnorm(n*p), n, p)
e <- rnorm(n, 0, 1)
beta <- c(1, 1, rep(0, p-2))
y <- x %*% beta + e
svr.eps <- 1
obj <- svrpath(x, y, svr.eps = svr.eps)



