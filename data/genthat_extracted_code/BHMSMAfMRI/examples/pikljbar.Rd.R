library(BHMSMAfMRI)


### Name: pikljbar
### Title: Compute the piklj bar values of the BHMSMA model using Newton
###   Cotes algorithm
### Aliases: pikljbar

### ** Examples

nsubject <- 3
grid <- 8
WaveletCoefficientMatrix <- matrix(nrow=3,ncol=63)
for(i in 1:3)
 WaveletCoefficientMatrix[i,] <- rnorm(63)
hyperparam <- rep(.1,6)
analysis <- "multi"
piklj.bar <- pikljbar(nsubject, grid, WaveletCoefficientMatrix, hyperparam, analysis)
dim(piklj.bar$pklj.bar)
#[1]  3 63



