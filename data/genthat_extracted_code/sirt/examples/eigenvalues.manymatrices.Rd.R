library(sirt)


### Name: eigenvalues.manymatrices
### Title: Computation of Eigenvalues of Many Symmetric Matrices
### Aliases: eigenvalues.manymatrices
### Keywords: Eigenvalues

### ** Examples

# define matrices
Sigma <- diag(1,3)
Sigma[ lower.tri(Sigma) ] <- Sigma[ upper.tri(Sigma) ] <- c(.4,.6,.8 )
Sigma1 <- Sigma

Sigma <- diag(1,3)
Sigma[ lower.tri(Sigma) ] <- Sigma[ upper.tri(Sigma) ] <- c(.2,.1,.99 )
Sigma2 <- Sigma

# collect matrices in a "super-matrix"
Sigma.all <- rbind( matrix( Sigma1, nrow=1, byrow=TRUE),
                matrix( Sigma2, nrow=1, byrow=TRUE) )
Sigma.all <- Sigma.all[ c(1,1,2,2,1 ), ]

# eigenvalue decomposition
m1 <- sirt::eigenvalues.manymatrices( Sigma.all )
m1

# eigenvalue decomposition for Sigma1
s1 <- svd(Sigma1)
s1



