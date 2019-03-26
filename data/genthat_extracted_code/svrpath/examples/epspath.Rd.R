library(svrpath)


### Name: epspath
### Title: Fit the entire 'epsilon' path for Support Vector Regression
### Aliases: epspath

### ** Examples

set.seed(1)
n <- 30
p <- 50

x <- matrix(rnorm(n*p), n, p)
e <- rnorm(n, 0, 1)
beta <- c(1, 1, rep(0, p-2))
y <- x %*% beta + e
lambda <- 1
eobj <- epspath(x, y, lambda = lambda)



