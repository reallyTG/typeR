library(mixtools)


### Name: rexpmix
### Title: Simulate from Mixtures of Exponentials
### Aliases: rexpmix
### Keywords: file

### ** Examples

## Generate data from a 2-component mixture of exponentials.
n=300 # sample size
m=2 # nb components
lambda=c(1/3, 2/3); rate = c(1,1/10) # parameters
set.seed(1234)
x <- rexpmix(n, lambda, rate) # iid ~ exp mixture

## histogram of the simulated data.
hist(x, col=8)



