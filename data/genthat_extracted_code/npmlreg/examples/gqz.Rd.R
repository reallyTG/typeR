library(npmlreg)


### Name: gqz
### Title: Gauss-Hermite integration points
### Aliases: gqz
### Keywords: models regression

### ** Examples

gqz(20, minweight=1e-14)
  # gives k=20 GH integration points. These are used in alldist  
  # and allvc as fixed mass point locations when working with 
  # option random.distribution='gq', and serve as EM starting points 
  # otherwise. 



