library(PRIMME)


### Name: eigs_sym
### Title: Find a few eigenvalues and vectors on large, sparse Hermitian
###   matrix
### Aliases: eigs_sym

### ** Examples

A <- diag(1:10)  # the eigenvalues of this matrix are 1:10 and the
                 # eigenvectors are the columns of diag(10)
r <- eigs_sym(A, 3);
r$values  # the three largest eigenvalues on diag(1:10)
r$vectors # the corresponding approximate eigenvectors
r$rnorms # the corresponding residual norms
r$stats$numMatvecs # total matrix-vector products spend

r <- eigs_sym(A, 3, 'SA') # compute the three smallest values

r <- eigs_sym(A, 3, 2.5) # compute the three closest values to 2.5

r <- eigs_sym(A, 3, 2.5, tol=1e-3); # compute the values with
r$rnorms                                    # residual norm <= 1e-3*||A||

# Build a Jacobi preconditioner (too convenient for a diagonal matrix!)
# and see how reduce the number matrix-vector products
A <- diag(1:1000)   # we use a larger matrix to amplify the difference
P <- diag(diag(A) - 2.5)
eigs_sym(A, 3, 2.5, tol=1e-3)$stats$numMatvecs
eigs_sym(A, 3, 2.5, tol=1e-3, prec=P)$stats$numMatvecs

# Passing A and the preconditioner as functions
Af <- function(x) (1:100) * x; # = diag(1:100) %*% x
Pf <- function(x) x / (1:100 - 2.5); # = solve(diag(1:100 - 2.5), x)
r <- eigs_sym(Af, 3, 2.5, tol=1e-3, prec=Pf, n=100)

# Passing initial guesses
A <- diag(1:1000)   # we use a larger matrix to amplify the difference
x0 <- diag(1,1000,4) + matrix(rnorm(4000), 1000, 4)/100;
eigs_sym(A, 4, "SA", tol=1e-3)$stats$numMatvecs
eigs_sym(A, 4, "SA", tol=1e-3, x0=x0)$stats$numMatvecs

# Passing orthogonal constrain, in this case, already compute eigenvectors
r <- eigs_sym(A, 4, "SA", tol=1e-3); r$values
eigs_sym(A, 4, "SA", tol=1e-3, ortho=r$vectors)$values




