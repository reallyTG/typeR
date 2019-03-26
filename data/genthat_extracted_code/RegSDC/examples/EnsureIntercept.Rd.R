library(RegSDC)


### Name: EnsureIntercept
### Title: Ensure constant term in matrix
### Aliases: EnsureIntercept
### Keywords: internal

### ** Examples

x <- matrix(c(5, 8, 4, 2, 7, 6), 3, 2)
EnsureIntercept(x)
EnsureIntercept(cbind(x, 2))
EnsureIntercept(cbind(x, 0))
EnsureIntercept(matrix(0, 4, 0))



