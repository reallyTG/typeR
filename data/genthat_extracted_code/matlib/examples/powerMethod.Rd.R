library(matlib)


### Name: powerMethod
### Title: Power Method for Eigenvectors
### Aliases: powerMethod

### ** Examples

A <- cbind(c(7, 3), c(3, 6))
powerMethod(A)
eigen(A)$values[1] # check
eigen(A)$vectors[,1]

# demonstrate how the power method converges to a solution
powerMethod(A, v = c(-.5, 1), plot = TRUE)

B <- cbind(c(1, 2, 0), c(2, 1, 3), c(0, 3, 1))
(rv <- powerMethod(B))

# deflate to find 2nd latent vector
l <- rv$value
v <- c(rv$vector)
B1 <- B - l * outer(v, v)
powerMethod(B1)
eigen(B)$vectors     # check

# a positive, semi-definite matrix, with eigenvalues 12, 6, 0
C <- matrix(c(7, 4, 1,  4, 4, 4,  1, 4, 7), 3, 3)
eigen(C)$vectors
powerMethod(C)



