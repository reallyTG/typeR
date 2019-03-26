library(chebpol)


### Name: interpolant
### Title: Evaluate an interpolant in a point
### Aliases: interpolant

### ** Examples

grid <- list(x=seq(0,1,length.out=10), y=seq(0,1,length.out=10))
val <- runif(100)
dim(val) <- c(10,10)
ip <- ipol(val, grid=grid, method='fh')
ip(c(0.3, 0.8))
ip(matrix(runif(12),2), threads=2)



