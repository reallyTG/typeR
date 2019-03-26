library(SuperGauss)


### Name: Toeplitz-class
### Title: Constructor and methods for Toeplitz matrix objects.
### Aliases: Toeplitz-class .Toeplitz setAcf getAcf traceT2 traceT4
###   show.Toeplitz %*% determinant solve %*%,ANY,Toeplitz-method
###   %*%,Toeplitz,ANY-method determinant,Toeplitz-method
###   dim,Toeplitz-method ncol,Toeplitz-method nrow,Toeplitz-method
###   show,Toeplitz-method solve,Toeplitz-method Toeplitz

### ** Examples

# construction
acf <- exp(-(1:5))
Toep <- Toeplitz(acf = acf)
# alternatively, can allocate space first
Toep <- Toeplitz(n = length(acf))
Toep$setAcf(acf = acf)

dim(Toep) # == c(nrow(Toep), ncol(Toep))
Toep # show method
Toep$getAcf() # extract the acf

# linear algebra
X <- matrix(rnorm(10), 5, 2)
Toep %*% X
t(X) %*% Toep
solve(Toep, X)
determinant(Toep) # log-determinant



