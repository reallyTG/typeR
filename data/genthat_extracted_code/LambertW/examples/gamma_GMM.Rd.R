library(LambertW)


### Name: gamma_GMM
### Title: Estimate gamma
### Aliases: gamma_GMM
### Keywords: optimize

### ** Examples


# highly skewed
y <- rLambertW(n = 1000, theta = list(beta = c(1, 2), gamma = 0.5), 
               distname = "normal") 
gamma_GMM(y, optim.fct = "nlminb")
gamma_GMM(y)




