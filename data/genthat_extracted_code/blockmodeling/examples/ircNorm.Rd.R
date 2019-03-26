library(blockmodeling)


### Name: ircNorm
### Title: Function for iterated row and column normalization of valued
###   matrices
### Aliases: ircNorm
### Keywords: manip

### ** Examples


A <- matrix(runif(100), ncol = 10)
A # A non-normalized matrix with different row and column sums.
apply(A, 1, sum)
apply(A, 2, sum)
A.norm <- ircNorm(A)
A.norm # Normalized matrix with all row and column sums approximately 1.
apply(A.norm, 1, sum)
apply(A.norm, 2, sum)



