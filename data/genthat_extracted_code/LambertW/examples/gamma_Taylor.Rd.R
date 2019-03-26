library(LambertW)


### Name: gamma_Taylor
### Title: Estimate gamma by Taylor approximation
### Aliases: gamma_Taylor
### Keywords: optimize

### ** Examples


set.seed(2)
# a little skewness
yy <- rLambertW(n = 1000, theta = list(beta = c(0, 1), gamma = 0.1), 
                distname = "normal") 
# Taylor estimate is good because true gamma = 0.1 close to 0
gamma_Taylor(yy) 

# very highly negatively skewed
yy <- rLambertW(n = 1000, theta = list(beta = c(0, 1), gamma = -0.75), 
                distname = "normal") 
# Taylor estimate is bad since gamma = -0.75 is far from 0; 
# and gamma = -0.5 is the lower bound by default.
gamma_Taylor(yy) 




