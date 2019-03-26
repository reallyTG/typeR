library(simest)


### Name: solve.pentadiag
### Title: Pentadiagonal Linear Solver.
### Aliases: solve.pentadiag
### Keywords: Pentadiagonal

### ** Examples

A <- matrix(c(2,1,1,0,0,
			  1,2,1,1,0,
			  1,1,2,1,1,
			  0,1,1,2,1,
			  0,0,1,1,2),nrow = 5)
b <- rnorm(5)
tmp <- solve.pentadiag(A, b)



