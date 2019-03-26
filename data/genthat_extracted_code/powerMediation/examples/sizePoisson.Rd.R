library(powerMediation)


### Name: sizePoisson
### Title: Sample size calculation for simple Poisson regression
### Aliases: sizePoisson
### Keywords: method

### ** Examples

# sample size = 28
print(sizePoisson(
  beta0 = 0.1, 
  beta1 = 0.5,
  mu.x1 = 0, 
  sigma2.x1 = 1,
  mu.T = 1, 
  phi = 1,
  alpha = 0.05, 
  power = 0.8))




