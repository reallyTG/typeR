library(SMMA)


### Name: RH
### Title: The Rotated H-transform of a 3d Array by a Matrix
### Aliases: RH glamlasso_RH Rotate H

### ** Examples


n1 <- 65; n2 <- 26; n3 <- 13; p1 <- 13; p2 <- 5; p3 <- 4

##marginal design matrices (Kronecker components)
X1 <- matrix(rnorm(n1 * p1), n1, p1) 
X2 <- matrix(rnorm(n2 * p2), n2, p2) 
X3 <- matrix(rnorm(n3 * p3), n3, p3) 

Beta <- array(rnorm(p1 * p2 * p3, 0, 1), c(p1 , p2, p3))
max(abs(c(RH(X3, RH(X2, RH(X1, Beta)))) - kronecker(X3, kronecker(X2, X1)) %*% c(Beta)))




