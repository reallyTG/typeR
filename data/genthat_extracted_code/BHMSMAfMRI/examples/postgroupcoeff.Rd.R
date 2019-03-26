library(BHMSMAfMRI)


### Name: postgroupcoeff
### Title: Obtain posterior group coefficients using the BHMSMA
###   methodology.
### Aliases: postgroupcoeff

### ** Examples

nsubject <- 3
grid <- 8
GLMCoeffStandardized <- array(rnorm(3*8*8),dim=c(3,8,8))
PostMeanWaveletCoeff <- array(rnorm(3*63),dim=c(3,63))
post.groupcoeff <- postgroupcoeff( nsubject, grid, GLMCoeffStandardized, PostMeanWaveletCoeff)
dim(post.groupcoeff$groupcoeff)
#[1] 8 8



