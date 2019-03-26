library(matlib)


### Name: QR
### Title: QR Decomposition by Graham-Schmidt Orthonormalization
### Aliases: QR

### ** Examples

A <- matrix(c(1,2,3,4,5,6,7,8,10), 3, 3) # a square nonsingular matrix
res <- QR(A)
res
q <- res$Q
zapsmall( t(q) %*% q)   # check that q' q = I
r <- res$R
q %*% r                 # check that q r = A

# relation to determinant: det(A) = prod(diag(R))
det(A)
prod(diag(r))

B <- matrix(1:9, 3, 3) # a singular matrix
QR(B)



