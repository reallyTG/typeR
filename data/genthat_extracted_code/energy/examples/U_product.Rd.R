library(energy)


### Name: U_product
### Title: Inner product in the Hilbert space of U-centered distance
###   matrices
### Aliases: U_product
### Keywords: multivariate

### ** Examples

 x <- iris[1:10, 1:4]
 y <- iris[11:20, 1:4]
 M1 <- as.matrix(dist(x))
 M2 <- as.matrix(dist(y))
 U <- U_center(M1)
 V <- U_center(M2)

 U_product(U, V)
 dcovU_stats(M1, M2)
 


