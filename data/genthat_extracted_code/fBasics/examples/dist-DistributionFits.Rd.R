library(fBasics)


### Name: DistributionFits
### Title: Parameter Fit of a Distribution
### Aliases: DistributionFits fDISTFIT fDISTFIT-class show,fDISTFIT-method
###   nFit tFit stableFit print.fDISTFIT
### Keywords: distribution

### ** Examples
    
## nFit -
   # Simulate random normal variates N(0.5, 2.0):
   set.seed(1953)
   s = rnorm(n = 1000, 0.5, 2) 

## nigFit -  
   # Fit Parameters:
   nFit(s, doplot = TRUE) 



