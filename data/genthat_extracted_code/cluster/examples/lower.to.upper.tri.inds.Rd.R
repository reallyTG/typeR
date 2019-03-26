library(cluster)


### Name: lower.to.upper.tri.inds
### Title: Permute Indices for Triangular Matrices
### Aliases: lower.to.upper.tri.inds upper.to.lower.tri.inds
### Keywords: array utilities

### ** Examples

m5 <- matrix(NA,5,5)
m <- m5; m[lower.tri(m)] <- upper.to.lower.tri.inds(5); m
m <- m5; m[upper.tri(m)] <- lower.to.upper.tri.inds(5); m

stopifnot(lower.to.upper.tri.inds(2) == 1,
          lower.to.upper.tri.inds(3) == 1:3,
          upper.to.lower.tri.inds(3) == 1:3,
     sort(upper.to.lower.tri.inds(5)) == 1:10,
     sort(lower.to.upper.tri.inds(6)) == 1:15)



