library(AnalyzeFMRI)


### Name: SmoothEst
### Title: Estimate the variance-covariance matrix of a Gaussian random
###   field
### Aliases: SmoothEst
### Keywords: utilities

### ** Examples


###############
## EXAMPLE 1 ##
###############
## example that illustrates the bias of the Friston
## method when smoothing is small compared to voxel size
## NB. The presence of bias becomes clearer if the
##     simulations below are run about 100 times and
##     the results averaged

ksize <- 13
d <- c(64, 64, 64)
voxdim <- c(1, 1, 1)
FWHM <- 2 ## using a small value of FWHM (=2) compared to voxel size (=1)
sigma <- diag(FWHM^2, 3) / (8 * log(2))
mask <- array(1, dim = d)
num.vox <- sum(mask)

grf <- Sim.3D.GRF(d = d, voxdim = voxdim, sigma = sigma,
                  ksize = ksize, mask = mask, type = "field")$mat
               
sigma
SmoothEst(grf, mask, voxdim, method = "Friston")
SmoothEst(grf, mask, voxdim, method = "Forman") ## compared to sigma
##the Forman estimator is better (on average) than the Friston estimator

###############
## EXAMPLE 2 ##
###############
## increasing the amount of smoothing decreases the bias of the Friston estimator

ksize <- 13
d <- c(64, 64, 64)
voxdim <- c(1, 1, 1)
FWHM <- 5 ## using a large value of FWHM (=5) compared to voxel size (=1)
sigma <- diag(FWHM^2, 3) / (8 * log(2))
mask <- array(1, dim = d)
num.vox <- sum(mask)

grf <- Sim.3D.GRF(d = d, voxdim = voxdim, sigma = sigma,
                  ksize = ksize, mask = mask, type = "field")$mat

SmoothEst(grf, mask, voxdim, method = "Friston")
SmoothEst(grf, mask, voxdim, method = "Forman")                
sigma




