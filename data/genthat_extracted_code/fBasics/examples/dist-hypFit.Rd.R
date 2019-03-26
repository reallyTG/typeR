library(fBasics)


### Name: hypFit
### Title: Fit of a Hyperbolic Distribution
### Aliases: hypFit
### Keywords: distribution

### ** Examples
    
## rhyp -
   # Simulate Random Variates:
   set.seed(1953)
   s = rhyp(n = 1000, alpha = 1.5, beta = 0.3, delta = 0.5, mu = -1.0) 

## hypFit -  
   # Fit Parameters:
   hypFit(s, alpha = 1, beta = 0, delta = 1, mu = mean(s), doplot = TRUE) 



