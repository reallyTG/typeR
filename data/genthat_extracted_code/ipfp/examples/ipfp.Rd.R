library(ipfp)


### Name: ipfp
### Title: Function to run IPFP (iterative proportional fitting procedure)
### Aliases: ipfp
### Keywords: array iteration

### ** Examples

A <- matrix(c(1,0,0, 1,0,0, 0,1,0, 0,1,0, 0,0,1), nrow=3)
x <- rgamma(ncol(A), 10, 1/100)
y <- A %*% x
x0 <- x * rgamma(length(x), 10, 10)
ans <- ipfp(y, A, x0, full=TRUE)
print(ans)
print(x)



