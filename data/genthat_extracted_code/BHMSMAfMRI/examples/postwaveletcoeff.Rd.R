library(BHMSMAfMRI)


### Name: postwaveletcoeff
### Title: Obtain posterior mean and posterior median of the wavelet
###   coefficients using BHMSMA methodology.
### Aliases: postwaveletcoeff

### ** Examples

nsubject <- 3
grid <- 8
nsample <- 5
GLMCoeffStandardized <- array(rnorm(3*8*8),dim=c(3,8,8))
WaveletCoefficientMatrix <- array(rnorm(3*63),dim=c(3,63))
hyperparam <- rep(.2,6)
pklj.bar <- array(runif(3*63),dim=c(3,63))
analysis <- "multi"
post.waveletcoeff <- postwaveletcoeff(nsubject, grid, WaveletCoefficientMatrix, 
hyperparam, pklj.bar, analysis)
dim(post.waveletcoeff$PostMeanWaveletCoeff)
#[1]  3 63



