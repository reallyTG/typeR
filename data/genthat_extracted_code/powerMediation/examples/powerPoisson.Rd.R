library(powerMediation)


### Name: powerPoisson
### Title: Power calculation for simple Poisson regression
### Aliases: powerPoisson
### Keywords: method

### ** Examples

# power = 0.8090542
print(powerPoisson(
    beta0 = 0.1, 
    beta1 = 0.5, 
    mu.x1 = 0, 
    sigma2.x1 = 1, 
    mu.T = 1, 
    phi = 1, 
    alpha = 0.05, 
    N = 28))





