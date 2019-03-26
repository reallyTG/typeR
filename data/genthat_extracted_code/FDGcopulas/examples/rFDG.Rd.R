library(FDGcopulas)


### Name: rFDG
### Title: Simulation of FDG copula models
### Aliases: rFDG

### ** Examples

## Generate a sample from a FDG copula with Fr\'echet generators
## and parameter vector 'theta'
theta <- c(.3,.5,.7,.9)
myFDGcopula <- FDGcopula("frechet", theta)
dat <- rFDG(30, myFDGcopula)
head(dat)



