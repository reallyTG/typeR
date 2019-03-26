library(Directional)


### Name: Saddlepoint approximations of the Fisher-Bingham distributions
### Title: Saddlepoint approximations of the Fisher-Bingham distributions
### Aliases: fb.saddle
### Keywords: Fisher-Bingham distribution Normalising constant Saddlepoint
###   approximation

### ** Examples

p <- 3  ;  k <- 1
0.5 * p * log(2 * pi) - (p/2 - 1) * log(k) + log( besselI(k, p/2 - 1, expon.scaled = TRUE) ) + k
## normalising constant of the
## von Mises-Fisher distribution
fb.saddle( c(0, k, 0), c(0, 0, 0) ) ## saddlepoint approximation

## Normalising constant of the Kent distribution
fb.saddle( c(0, 10, 0), c(0, -2, 2) )
kent.logcon(10, 2)



