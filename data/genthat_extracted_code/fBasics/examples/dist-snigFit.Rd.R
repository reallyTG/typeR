library(fBasics)


### Name: snigFit
### Title: Fit of a Stndardized NIG Distribution
### Aliases: snigFit
### Keywords: distribution

### ** Examples
    
## snigFit -
   # Simulate Random Variates:
   set.seed(1953)
   s = rsnig(n = 2000, zeta = 0.7, rho = 0.5) 

## snigFit -  
   # Fit Parameters:
   snigFit(s, zeta = 1, rho = 0, doplot = TRUE) 



