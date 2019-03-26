library(MVT)


### Name: commutation
### Title: Commutation matrix for square matrices
### Aliases: commutation
### Keywords: array algebra

### ** Examples

a <- matrix(1:9, ncol = 3)
kmat <- commutation(nrow(a))
vec <- as.vector(a)
## vectorization of t(a):
kmat %*% vec



