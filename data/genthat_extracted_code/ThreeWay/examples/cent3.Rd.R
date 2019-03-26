library(ThreeWay)


### Name: cent3
### Title: Centering of a matricized array
### Aliases: cent3
### Keywords: array multivariate algebra

### ** Examples

X <- array(c(rnorm(120)),c(6,5,4))
# matricized array
Y <- supermat(X)
# data centered across A-mode
Z <- cent3(Y$Xa, 6, 5, 4, 1)
apply(Z,2,mean)
# data centered also across B-modes (double centering)
Z <- cent3(Z, 6, 5, 4, 2)
apply(Z,1,mean)
apply(Z,2,mean)



