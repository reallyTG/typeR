library(fBasics)


### Name: nigFit
### Title: Fit of a Normal Inverse Gaussian Distribution
### Aliases: nigFit
### Keywords: distribution

### ** Examples
    
## nigFit -
   # Simulate Random Variates:
   set.seed(1953)
   s = rnig(n = 1000, alpha = 1.5, beta = 0.3, delta = 0.5, mu = -1.0) 

## nigFit -  
   # Fit Parameters:
   nigFit(s, alpha = 1, beta = 0, delta = 1, mu = mean(s), doplot = TRUE) 



