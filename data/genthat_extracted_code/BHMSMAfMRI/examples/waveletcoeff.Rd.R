library(BHMSMAfMRI)


### Name: waveletcoeff
### Title: Apply discrete wavelet transform to the GLM coefficients and
###   obtain the wavelet coefficients.
### Aliases: waveletcoeff

### ** Examples

nsubject <- 3
grid <- 8
Data <- array(dim=c(3,8,8,10),rnorm(3*8*8*10))
DesignMatrix <- cbind( c(rep(c(1,0),5)), rep(1,10) )
glm.fit <- glmcoeff(nsubject, grid, Data, DesignMatrix)
GLMCoeffStandardized <- glm.fit$GLMCoeffStandardized
wavelet.coeff <- waveletcoeff(nsubject, grid, GLMCoeffStandardized)
dim(wavelet.coeff$WaveletCoefficientMatrix)
#[1]  3 63



