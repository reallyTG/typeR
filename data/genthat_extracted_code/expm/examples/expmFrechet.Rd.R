library(expm)


### Name: expmFrechet
### Title: Frechet Derivative of the Matrix Exponential
### Aliases: expmFrechet
### Keywords: algebra math

### ** Examples

(A <- cbind(1, 2:3, 5:8, c(9,1,5,3)))
E <- matrix(1e-3, 4,4)
(L.AE <- expmFrechet(A, E))
all.equal(L.AE, expmFrechet(A, E, "block"), tolerance = 1e-14) ## TRUE



