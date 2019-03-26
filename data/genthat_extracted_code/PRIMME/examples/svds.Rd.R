library(PRIMME)


### Name: svds
### Title: Find a few singular values and vectors on large, sparse matrix
### Aliases: svds

### ** Examples

A <- diag(1:5,10,5)  # the singular values of this matrix are 1:10 and the
                        # left and right singular vectors are the columns of
                        # diag(1,100,10) and diag(10), respectively
r <- svds(A, 3);
r$d # the three largest singular values on A
r$u # the corresponding approximate left singular vectors
r$v # the corresponding approximate right singular vectors
r$rnorms # the corresponding residual norms
r$stats$numMatvecs # total matrix-vector products spend

r <- svds(A, 3, "S") # compute the three smallest values

r <- svds(A, 3, 2.5) # compute the three closest values to 2.5

A <- diag(1:500,500,100)   # we use a larger matrix to amplify the difference
r <- svds(A, 3, 2.5, tol=1e-3); # compute the values with 
r$rnorms                               # residual norm <= 1e-3*||A||

# Build the diagonal squared preconditioner
# and see how reduce the number matrix-vector products
P <- diag(colSums(A^2))
svds(A, 3, "S", tol=1e-3)$stats$numMatvecs
svds(A, 3, "S", tol=1e-3, prec=list(AHA=P))$stats$numMatvecs

# Passing A and the preconditioner as functions
Af <- function(x,mode) if (mode == "n") A%*%x else crossprod(A,x);
P = colSums(A^2);
PAHAf <- function(x) x / P;
r <- svds(Af, 3, "S", tol=1e-3, prec=list(AHA=PAHAf), m=500, n=100)

# Passing initial guesses
v0 <- diag(1,100,4) + matrix(rnorm(400), 100, 4)/100;
svds(A, 4, "S", tol=1e-3)$stats$numMatvecs
svds(A, 4, "S", tol=1e-3, v0=v0)$stats$numMatvecs

# Passing orthogonal constrain, in this case, already compute singular vectors
r <- svds(A, 4, "S", tol=1e-3); r$d
svds(A, 4, "S", tol=1e-3, orthov=r$v)$d




