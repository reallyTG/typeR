library(pdSpecEst)


### Name: pdMean
### Title: Weighted Karcher mean of HPD matrices
### Aliases: pdMean

### ** Examples

## Generate random sample of HPD matrices
m <- function(){
 X <- matrix(complex(real=rnorm(9), imaginary=rnorm(9)), nrow=3)
 t(Conj(X)) %*% X
}
M <- replicate(100, m())
z <- rnorm(100)
## Generate random weight vector
w <- abs(z)/sum(abs(z))
## Compute weighted (Riemannian) Karcher mean
pdMean(M, w)




