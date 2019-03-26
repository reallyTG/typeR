library(fBasics)


### Name: sghFit
### Title: Standardized GH Distribution Fit
### Aliases: sghFit
### Keywords: distribution

### ** Examples
    
## sghFit -
   # Simulate Random Variates:
   set.seed(1953)
   s = rsgh(n = 2000, zeta = 0.7, rho = 0.5, lambda = 0) 

## sghFit -  
   # Fit Parameters:
   sghFit(s, zeta = 1, rho = 0, lambda = 1, include.lambda = TRUE, 
     doplot = TRUE) 



