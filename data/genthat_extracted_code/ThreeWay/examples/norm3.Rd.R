library(ThreeWay)


### Name: norm3
### Title: Normalization of a matricized array
### Aliases: norm3
### Keywords: array multivariate algebra

### ** Examples

X <- array(c(rnorm(120)), c(6,5,4))
# matricized array
Y <- supermat(X)
# data normalized within A-mode
Z <- norm3(Y$Xa, 6, 5, 4, 1)
apply(Z^2,1,sum)
# data normalized within C-mode
Z <- norm3(Y$Xa, 6, 5, 4, 3)
Z <- permnew(Z, 6, 5, 4)
Z <- permnew(Z, 5, 4, 6)
apply(Z^2, 1, sum)



