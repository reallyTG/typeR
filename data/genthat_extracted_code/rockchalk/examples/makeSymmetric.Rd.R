library(rockchalk)


### Name: makeSymmetric
### Title: Create Symmetric Matrices, possibly covariance or correlation
###   matrices, or check a matrix for symmetry and serviceability.
### Aliases: makeSymmetric

### ** Examples

makeSymmetric(X = 3, d = 4)
makeSymmetric(X = 3, d = 4, diag = c(99, 98, 97, 96))
makeSymmetric(c(1,2,3))
makeSymmetric(c(1,2,3), d = 5)
makeSymmetric(c(0.8,0.4, 0.2), cov = TRUE)
makeSymmetric(c(0.8,0.4, 0.2), cov = TRUE, diag = c(44, 55, 66))




