library(bigalgebra)


### Name: daxpy
### Title: BLAS daxpy functionality
### Aliases: daxpy

### ** Examples

require(bigmemory)
A = matrix(1, nrow=3, ncol=2)
B = big.matrix(nrow=3, ncol=2, type='double', init=1)
C = B + B   # C is a new big matrix
D = A + B   # D defaults to a regular R matrix, to change this, set the option:
            # optons(bigalgebra.mixed_arithmetic_returns_R_matrix=FALSE)
E = daxpy(A=1.0, X=B, Y=B)  # Same kind of result as C
print(C[])
print(D)
print(E[])

# The C and E big.matrix file backings will be deleted when garbage collected:
# (We enable debugging to see this explicitly)
options(bigalgebra.DEBUG=TRUE)
rm(C,E)
gc()



