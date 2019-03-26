library(BHMSMAfMRI)


### Name: postsamples
### Title: Generate samples from the posterior distribution of the GLM
###   coefficients.
### Aliases: postsamples

### ** Examples

nsubject <- 3
grid <- 8
nsample <- 5
GLMCoeffStandardized <- array(rnorm(3*8*8),dim=c(3,8,8))
WaveletCoefficientMatrix <- array(rnorm(3*63),dim=c(3,63))
hyperparam <- rep(.2,6)
pklj.bar <- array(runif(3*63),dim=c(3,63))
analysis <- "multi"
post.samples <- postsamples(nsample, nsubject, grid, GLMCoeffStandardized, 
WaveletCoefficientMatrix, hyperparam, pklj.bar, analysis)
dim(post.samples$samples)
#[1] 3 8 8 5



