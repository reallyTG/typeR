library(MVT)


### Name: duplication
### Title: Duplication matrix
### Aliases: duplication
### Keywords: array algebra

### ** Examples

dmat <- duplication(3)
a <- matrix(c( 1, 2, 3,
               2, 3, 4,
               3, 4, 5), nrow = 3)
vech <- a[upper.tri(a, diag = TRUE)]
vec <- dmat %*% vech
as.vector(vec)



