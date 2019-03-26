library(steadyICA)


### Name: W2theta
### Title: Convert an orthogonal matrix to its angular parameterization.
### Aliases: W2theta
### Keywords: Givens orthogonal

### ** Examples

theta = c(pi/6,pi/4,pi/2)

(W = theta2W(theta))

#Recover theta:
W2theta(W)



