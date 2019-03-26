library(demogR)


### Name: odiag
### Title: odiag
### Aliases: odiag
### Keywords: array algebra

### ** Examples


## Construct a matrix from a vector
## random survival probabilities with mean 0.9 and variance 0.0082

y <- rbeta(4,9,1)
A <- odiag(y,-1)

## add fertilities
F <- c(0,rep(1,4))
A[1,] <- F

## Extract a vector from a matrix
A <- matrix(rnorm(25), nr=5, nc=5)
odiag(A,2)



