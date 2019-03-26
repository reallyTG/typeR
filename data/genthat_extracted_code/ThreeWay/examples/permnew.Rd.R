library(ThreeWay)


### Name: permnew
### Title: Permutation of a matricized array
### Aliases: permnew
### Keywords: array multivariate algebra

### ** Examples

X <- array(c(rnorm(120)),c(6,5,4))
dim(X)
# matricized array
Xa <- supermat(X)$Xa
# matricized X with the A-mode entities in its rows
dim(Xa)
# matricized X with the B-mode entities in its rows
Xb <- permnew(Xa, 6, 5, 4)
dim(Xb)
# matricized X with the C-mode entities in its rows
Xc <- permnew(Xb, 5, 4, 6)
dim(Xc)



