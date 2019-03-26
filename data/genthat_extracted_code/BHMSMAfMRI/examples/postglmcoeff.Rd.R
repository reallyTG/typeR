library(BHMSMAfMRI)


### Name: postglmcoeff
### Title: Obtain the posterior mean of the GLM coefficients using the
###   posterior mean of the wavelet coefficients.
### Aliases: postglmcoeff

### ** Examples

nsubject <- 3
grid <- 8
GLMCoeffStandardized <- array(rnorm(3*8*8),dim=c(3,8,8))
PostMeanWaveletCoeff <- array(rnorm(3*63),dim=c(3,63))
postglm.coeff <- postglmcoeff(nsubject, grid, GLMCoeffStandardized, PostMeanWaveletCoeff)
dim(postglm.coeff$GLMcoeffposterior)
#[1] 3 8 8



