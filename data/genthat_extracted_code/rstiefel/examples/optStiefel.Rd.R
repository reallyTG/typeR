library(rstiefel)


### Name: optStiefel
### Title: Optimize a function on the Stiefel manifold
### Aliases: optStiefel

### ** Examples

## Find the first eigenspace spanned by the first P eigenvectors for a 
## matrix M. The size of the matrix has been kept small and the tolerance 
## has been raised to keep the runtime 
## of this example below the CRAN submission threshold. 

N <- 500
P <- 3
Lam <- diag(c(10, 5, 3, rep(1, N-P)))
U <- rustiefel(N, N)
M <- U %*% Lam %*% t(U)

F <- function(V) { - sum(diag(t(V) %*% M %*% V)) }
dF <- function(V) { - 2*M %*% V }
V = optStiefel(F, dF, Vinit=rustiefel(N, P),
               method="curvilinear",
               searchParams=list(rho1=0.1, rho2=0.9, tau=1),tol=1e-4)
               
print(sprintf("Sum of first %d eigenvalues is %f", P, -F(V)))




