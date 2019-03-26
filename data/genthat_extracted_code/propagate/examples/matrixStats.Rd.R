library(propagate)


### Name: matrixStats
### Title: Fast column- and row-wise versions of variance coded in C++
### Aliases: colVarsC rowVarsC
### Keywords: univar

### ** Examples

## Speed comparison on large matrix.
## ~ 110x speed increase!
## Not run: 
##D MAT <- matrix(rnorm(10 * 500000), ncol = 10)
##D system.time(RES1 <- apply(MAT, 1, var))
##D system.time(RES2 <- rowVarsC(MAT))
##D all.equal(RES1, RES2)
## End(Not run)



