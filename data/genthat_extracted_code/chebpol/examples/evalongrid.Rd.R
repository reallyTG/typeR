library(chebpol)


### Name: evalongrid
### Title: Evaluate a function on a grid
### Aliases: evalongrid evalongridV

### ** Examples


f <- function(x) {a <- sum(x^2); ifelse(a == 0,0,exp(-1/a))}
## Standard Chebyshev grid
evalongrid(f,dims=c(3,5))
## Then Chebyshev on [0,1] x [2,3]
evalongrid(f,dims=c(3,5),intervals=list(c(0,1),c(2,3)))
## And on my own grid
grid <- list(sort(rnorm(3)),sort(rnorm(5)))
evalongrid(f,grid=grid)
g <- ipol(f,grid=grid,method='fh')
evalongridV(g, grid=grid, threads=2)
## vector valued function
f <- function(x) c(prod(x),sum(x^2))
evalongrid(f,grid=grid)




