library(AnalyzeFMRI)


### Name: GaussSmoothArray
### Title: Spatially smooth an array with Gaussian kernel.
### Aliases: GaussSmoothArray
### Keywords: utilities

### ** Examples

d <- c(10, 10, 10, 20)
mat <- array(rnorm(cumprod(d)[length(d)]), dim = d)
mat[, , 6:10, ] <- mat[, , 6:10, ] + 3
mask <- array(0, dim = d[1:3])
mask[3:8, 3:8, 3:8] <- 1
b <- GaussSmoothArray(mat, mask = mask, voxdim = c(1, 1, 1), ksize = 5, sigma = diag(1, 3))      



