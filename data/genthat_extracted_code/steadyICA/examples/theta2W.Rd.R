library(steadyICA)


### Name: theta2W
### Title: Convert angles to an orthogonal matrix.
### Aliases: theta2W
### Keywords: Givens orthogonal

### ** Examples

#Generate orthogonal matrix:
mat <- matrix(rnorm(9),3,3)
W = svd(mat)$u

theta <- W2theta(W)

#Recovers W:
theta2W(theta)



