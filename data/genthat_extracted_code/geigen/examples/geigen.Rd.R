library(geigen)


### Name: geigen
### Title: Generalized Eigenvalues
### Aliases: geigen
### Keywords: algebra array

### ** Examples

A <- matrix(c(14, 10, 12,
              10, 12, 13,
              12, 13, 14), nrow=3, byrow=TRUE)

B <- matrix(c(48, 17, 26,
              17, 33, 32,
              26, 32, 34), nrow=3, byrow=TRUE)

z1 <- geigen(A, B, symmetric=FALSE, only.values=TRUE)
z2 <- geigen(A, B, symmetric=FALSE, only.values=FALSE )
z2

# geigen(A, B)
z1 <- geigen(A, B, only.values=TRUE)
z2 <- geigen(A, B, only.values=FALSE)
z1;z2

A.c <- A + 1i
B.c <- B + 1i

A[upper.tri(A)] <- A[upper.tri(A)] + 1i
A[lower.tri(A)] <- Conj(t(A[upper.tri(A)]))

B[upper.tri(B)] <- B[upper.tri(B)] + 1i
B[lower.tri(B)] <- Conj(t(B[upper.tri(B)]))

isSymmetric(A)
isSymmetric(B)

z1 <- geigen(A, B, only.values=TRUE)
z2 <- geigen(A, B, only.values=FALSE)
z1;z2



