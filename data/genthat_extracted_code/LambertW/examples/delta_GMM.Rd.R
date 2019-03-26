library(LambertW)


### Name: delta_GMM
### Title: Estimate delta
### Aliases: delta_GMM
### Keywords: optimize

### ** Examples


# very heavy-tailed (like a Cauchy)
y <- rLambertW(n = 1000, theta = list(beta = c(1, 2), delta = 1), 
               distname = "normal")
delta_GMM(y) # after the first iteration




