library(pdSpecEst)


### Name: pdkMeans
### Title: K-means clustering for HPD matrices
### Aliases: pdkMeans

### ** Examples

## Generate 20 random HPD matrices in 2 groups
m <- function(rescale){
 x <- matrix(complex(real = rescale * rnorm(9), imaginary = rescale * rnorm(9)), nrow = 3)
 t(Conj(x)) %*% x
}
X <- array(c(replicate(10, m(0.25)), replicate(10, m(1))), dim = c(3, 3, 20))

## Compute fuzzy k-means cluster assignments
cl <- pdkMeans(X, K = 2, m = 2)$cl.assignments




