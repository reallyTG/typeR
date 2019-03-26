library(svrpath)


### Name: solve.svr
### Title: QP solver for SVR
### Aliases: solve.svr

### ** Examples

## No test: 
# set.seed(1)
n <- 30
p <- 50

x <- matrix(rnorm(n*p), n, p)
e <- rnorm(n, 0, 1)
beta <- c(1, 1, rep(0, p-2))
y <- x %*% beta + e
solve.svr(x, y) 
## End(No test)




