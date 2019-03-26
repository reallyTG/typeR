library(SpatioTemporal)


### Name: calc.mu.B
### Title: Matrix Multiplication with Block Matrices
### Aliases: calc.mu.B calc.iS.X calc.X.iS.X

### ** Examples

## Create a block diagonal matrix, ...
iS <- rbind(c(2,1,0,0), c(1,3,0,0),
            c(0,0,3,2), c(0,0,2,4))
## ... a block matrix ...
X <- list(matrix(c(1,2)), matrix(c(2,2,3,4),2,2))
## ... with alternative form, ...
Xt <- rbind(cbind(X[[1]], matrix(0,2,2)),
            cbind(matrix(0,2,1), X[[2]]))
## ... and a vector alpha.
alpha <- list(c(1), c(-2,1))

## Compute iS * X
iS.X <- calc.iS.X(X, iS)
## or
iS %*% Xt
## Don't show: 
  if( max(abs(iS.X - (iS %*% Xt))) > 1e-13 ){
    stop("calc.iS.X: Results not equal")
  }
## End(Don't show)
## Compute X'* iS * X
calc.X.iS.X(X, iS.X)
## or
t(Xt) %*% iS %*% Xt
## Don't show: 
  if( max(abs(calc.X.iS.X(X, iS.X) - (t(Xt) %*% iS %*% Xt))) > 1e-13 ){
    stop("calc.X.iS.X: Results not equal")
  }
## End(Don't show)
## Compute X* alpha
calc.mu.B(X, alpha)
## or
cbind(X[[1]] %*% alpha[[1]], X[[2]] %*% alpha[[2]])
## Don't show: 
  if( max(abs(cbind(X[[1]] %*% alpha[[1]], X[[2]] %*% alpha[[2]]) -
              calc.mu.B(X, alpha))) > 1e-13 ){
    stop("calc.mu.B: Results not equal")
  }
## End(Don't show)



