library(networkTomography)


### Name: ipfp
### Title: Function to run basic IPFP (iterative proportional fitting
###   procedure)
### Aliases: ipfp
### Keywords: array iteration

### ** Examples

A <- buildStarMat(3)
x <- rgamma(ncol(A), 10, 1/100)
y <- A %*% x
x0 <- x * rgamma(length(x), 10, 10)
ans <- ipfp(y, A, x0, full=TRUE)
print(ans)
print(x)



