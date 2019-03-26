library(fBasics)


### Name: gldFit
### Title: GH Distribution Fit
### Aliases: gldFit
### Keywords: distribution

### ** Examples
    
## gldFit -
   # Simulate Random Variates:
   set.seed(1953)
   s = rgld(n = 1000, lambda1=0, lambda2=-1, lambda3=-1/8, lambda4=-1/8) 

## gldFit -  
   # Fit Parameters:
   gldFit(s, lambda1=0, lambda2=-1, lambda3=-1/8, lambda4=-1/8, 
     doplot = TRUE, trace = TRUE) 



