library(FDGcopulas)


### Name: fitFDG
### Title: Estimation of FDG copulas
### Aliases: fitFDG

### ** Examples

## Create an object of class 'FDGcopula'
theta <- c(.3,.5,.7,.9)
myFDGcopula <- FDGcopula("frechet", theta)

## Generate a sample from a FDG copula with Frechet generators
## and parameter vector 'theta'
dat <- rFDG(100, myFDGcopula)
## Fit a FDG copula to the data
myFittedCopula <- fitFDG(myFDGcopula, dat)
myFittedCopula



