library(msos)


### Name: reverse.kronecker
### Title: Reverses the matrices in a Kronecker product
### Aliases: reverse.kronecker

### ** Examples


# Create matrices
( A <- diag(1,3) )
( B <- matrix(1:6, ncol = 2) )

# Perform kronecker
( kron <- kronecker(A, B) )

# Perform reverse kronecker product
( reverse.kronecker(kron, 3, 3))

# Perform kronecker again
( kron2 <- kronecker(B, A) )




