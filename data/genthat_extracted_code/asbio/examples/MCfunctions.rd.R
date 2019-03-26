library(asbio)


### Name: MC
### Title: Simple functions for MCMC demonstrations
### Aliases: MC Rf mat.pow
### Keywords: manip

### ** Examples

A <- matrix(nrow = 4, ncol = 4, c(0.5, 0.5, 0, 0, 0.25, 0.5, 0.25,0, 0, 0.25, 0.5, 0.25, 
0, 0, 0.5, 0.5), byrow = TRUE)
pi.0 <- c(1, 0, 0, 0)
Tp10 <- mat.pow(A, 10)
chain <- MC(A, 1, 100)
Rf(chain)



