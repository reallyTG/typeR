library(AnalyzeFMRI)


### Name: cov.est
### Title: Estimates the covariance between neighbouring voxels
### Aliases: cov.est covariance_est
### Keywords: utilities

### ** Examples

ksize <- 9
d <- c(64, 64, 21)
FWHM <- 9
sigma <- diag(FWHM^2, 3) / (8 * log(2))
voxdim <- c(2, 2, 4)

filtermat <- GaussSmoothKernel(voxdim, ksize, sigma)

mask <- array(1, dim = d)
num.vox <- sum(mask)

mat <- Sim.3D.GRF(d = d, voxdim = voxdim, sigma = sigma,
                  ksize = ksize, mask = mask, type = "field")$mat

nmat <- expand.grid(-1:1, -1:1, -1:1)
nmat4 <- nmat[c(11, 13, 15, 17), ]

cov <- cov.est(mat, mask, nmat4)



