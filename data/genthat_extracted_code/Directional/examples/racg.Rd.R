library(Directional)


### Name: Angular central Gaussian random values simulation
### Title: Angular central Gaussian random values simulation
### Aliases: racg
### Keywords: Angular central Gaussian distribution random values
###   simulation directional data

### ** Examples

s <- cov( iris[, 1:4] )
x <- racg(100, s)
acg(x)  
vmf(x)  ## the concentration parameter, kappa, is very low, close to zero, as expected.



