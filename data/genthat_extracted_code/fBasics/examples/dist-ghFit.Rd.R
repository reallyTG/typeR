library(fBasics)


### Name: ghFit
### Title: GH Distribution Fit
### Aliases: ghFit
### Keywords: distribution

### ** Examples
    
## ghFit -
   # Simulate Random Variates:
   set.seed(1953)
   s = rgh(n = 1000, alpha = 1.5, beta = 0.3, delta = 0.5, mu = -1.0) 

## ghFit -  
   # Fit Parameters:
   ghFit(s, alpha = 1, beta = 0, delta = 1, mu = mean(s), doplot = TRUE) 



