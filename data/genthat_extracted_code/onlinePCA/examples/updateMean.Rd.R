library(onlinePCA)


### Name: updateMean
### Title: Update the Sample Mean Vector
### Aliases: updateMean

### ** Examples

n <- 1e4
n0 <- 5e3
d <- 10
x <- matrix(runif(n*d), n, d)

## Direct computation
xbar1 <- colMeans(x)

## Recursive computation
xbar2 <- colMeans(x[1:n0,])
xbar2 <- updateMean(xbar2, x[(n0+1):n,], n0)

## Check equality
all.equal(xbar1, xbar2)



