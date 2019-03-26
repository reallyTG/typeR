library(pdSpecEst)


### Name: pdMedian
### Title: Weighted intrinsic median of HPD matrices
### Aliases: pdMedian

### ** Examples

## Generate random sample of HPD matrices
m <- function(){
 X <- matrix(complex(real=rnorm(9), imaginary=rnorm(9)), nrow=3)
 t(Conj(X)) %*% X
}
M <- replicate(100, m())
## Generate random weight vector
z <- rnorm(100)
w <- abs(z)/sum(abs(z))
## Compute weighted intrinsic (Riemannian) median
pdMedian(M, w)




