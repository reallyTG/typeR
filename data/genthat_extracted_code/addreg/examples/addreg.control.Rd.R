library(addreg)


### Name: addreg.control
### Title: Auxiliary for Controlling addreg Fitting
### Aliases: addreg.control
### Keywords: optimize models

### ** Examples

## Variation on example(glm.control) :

counts <- c(18,17,15,20,10,20,25,13,12)
outcome <- gl(3,1,9)
treatment <- gl(3,3)
oo <- options(digits = 12)
addreg.D93X <- addreg(counts ~ outcome + treatment, family = poisson, 
  trace = 2, epsilon = 1e-2)
options(oo)
coef(addreg.D93X)



