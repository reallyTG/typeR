library(VGAMextra)


### Name: rayleighQlink
### Title: Link functions for the quantiles of several 1-parameter
###   continuous distributions
### Aliases: rayleighQlink

### ** Examples

 ## E1. rayleighQlink() and its inverse ##
  p <- 0.50                           ## Modeling the median
  my.b <- seq(0, 5, by = 0.1)[-1]
  max(my.b - rayleighQlink(rayleighQlink(my.b, p = p), p = p, inverse  =TRUE)) ## Zero


 ## E2. Special values ##
  rayleighQlink(theta = c(Inf, -Inf, NA, NaN), p = p)
    
    
 ## E3. Use of argument 'bvalue' ##
  rayleighQlink(theta = seq(-0.2, 1.0, by = 0.1), p = p)  # WARNING: NaNs if theta <= 0
  rayleighQlink(theta = seq(-0.2, 1.0, by = 0.1), p = p, bvalue = .Machine$double.xmin)
    



