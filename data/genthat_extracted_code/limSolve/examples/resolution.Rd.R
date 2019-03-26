library(limSolve)


### Name: resolution
### Title: Row and column resolution of a matrix.
### Aliases: resolution
### Keywords: array

### ** Examples

resolution (matrix(nrow = 3, runif(9)))  #3rows,3columns
resolution (matrix(nrow = 3, runif(12))) #3rows,4columns
resolution (matrix(nrow = 3, runif(6)))  #3rows,2columns
resolution (cbind(c(1, 2, 3), c(2, 3, 4), c(3, 5, 7))) # r3=r1+r2,c3=c1+c2



