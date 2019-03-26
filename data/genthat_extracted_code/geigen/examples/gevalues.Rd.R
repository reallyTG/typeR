library(geigen)


### Name: gevalues
### Title: Calculate Generalized Eigenvalues from a Generalized Schur
###   decomposition
### Aliases: gevalues
### Keywords: algebra array

### ** Examples

# Real matrices
# example from NAG: http://www.nag.com/lapack-ex/node116.html
# Find the generalized Schur decomposition with the real eigenvalues ordered to come first

A <- matrix(c(  3.9, 12.5,-34.5,-0.5,
                4.3, 21.5,-47.5, 7.5,
                4.3, 21.5,-43.5, 3.5,
                4.4, 26.0,-46.0, 6.0), nrow=4, byrow=TRUE)

B <- matrix(c( 1.0, 2.0, -3.0, 1.0,
               1.0, 3.0, -5.0, 4.0,
               1.0, 3.0, -4.0, 3.0,
               1.0, 3.0, -4.0, 4.0), nrow=4, byrow=TRUE)

z <- gqz(A, B,"R")
z
# compute the generalized eigenvalues
ger <- gevalues(z)
ger



