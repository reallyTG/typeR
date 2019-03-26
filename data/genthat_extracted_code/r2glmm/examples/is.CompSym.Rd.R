library(r2glmm)


### Name: is.CompSym
### Title: Checks if a matrix is Compound Symmetric.
### Aliases: is.CompSym

### ** Examples


gcmat <- matrix(c(1,0.2,0.1,0.2,1,0.3,0.1,0.3,1), nrow = 3)
csmat <- matrix(c(1,0.2,0.2,0.2,1,0.2,0.2,0.2,1), nrow = 3)
is.CompSym(csmat)



