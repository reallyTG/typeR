library(ThreeWay)


### Name: supermat
### Title: Matrix unfolding
### Aliases: supermat
### Keywords: array multivariate algebra

### ** Examples

# array (2x2x2) with integers from 1 to 8
X <- array(1:8,c(2,2,2))
Y <- supermat(X)
# matricized arrays
Y$Xa
Y$Xb
Y$Xc 



