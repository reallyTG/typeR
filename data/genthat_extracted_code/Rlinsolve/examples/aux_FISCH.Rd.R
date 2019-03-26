library(Rlinsolve)


### Name: aux.fisch
### Title: Generate a 2-dimensional discrete Poisson matrix
### Aliases: aux.fisch

### ** Examples

## generate dense and sparse Poisson matrix of size 25 by 25.
A = aux.fisch(5, sparse=FALSE)
B = aux.fisch(5, sparse=TRUE)
(all(A==B)) # TRUE if two matrices are equal.





