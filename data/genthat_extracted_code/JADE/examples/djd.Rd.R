library(JADE)


### Name: djd
### Title: Function for Joint Diagonalization of k Square Matrices in a
###   Deflation Based Manner
### Aliases: djd
### Keywords: array

### ** Examples

Z <- matrix(runif(9), ncol = 3)
U <- eigen(Z %*% t(Z))$vectors
D1 <- diag(runif(3))
D2 <- diag(runif(3))
D3 <- diag(runif(3))
D4 <- diag(runif(3))

X.matrix <- array(0, dim=c(3, 3, 4))
X.matrix[,,1] <- t(U) %*% D1 %*% U
X.matrix[,,2] <- t(U) %*% D2 %*% U
X.matrix[,,3] <- t(U) %*% D3 %*% U
X.matrix[,,4] <- t(U) %*% D4 %*% U

W1 <- djd(X.matrix)
round(U %*% W1, 4) # should be a signed permutation 
                     # matrix if W1 is correct.

W2 <- djd(X.matrix, r=1)
round(U %*% W2, 4) # should be a signed permutation 
                     # matrix if W2 is correct.

W3 <- djd(X.matrix, G="l")
round(U %*% W3, 4) # should be a signed permutation 
                     # matrix if W3 is correct.




