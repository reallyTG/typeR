library(uniformly)


### Name: volume_ellipsoid
### Title: Ellipsoid volume
### Aliases: volume_ellipsoid

### ** Examples

# dimension 2 (area), with diagonal matrix A
A <- diag(c(2,3))
r <- 2
volume_ellipsoid(A, r)
pi * r^2 / sqrt(A[1,1]*A[2,2])



