library(LambertW)


### Name: delta_Taylor
### Title: Estimate of delta by Taylor approximation
### Aliases: delta_Taylor
### Keywords: optimize

### ** Examples


set.seed(2)
# a little heavy-tailed (kurtosis does exist)
y <- rLambertW(n = 1000, theta = list(beta = c(0, 1), delta = 0.2), 
               distname = "normal")
# good initial estimate since true delta=0.2 close to 0, and
# empirical kurtosis well-defined.
delta_Taylor(y) 
delta_GMM(y) # iterative estimate

y <- rLambertW(n = 1000, theta = list(beta = c(0, 1), delta = 1), 
               distname = "normal") # very heavy-tailed (like a Cauchy)
delta_Taylor(y) # bounded by 1/4 (as otherwise kurtosis does not exist)
delta_GMM(y) # iterative estimate




