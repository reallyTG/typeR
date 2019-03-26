library(provenance)


### Name: ALR
### Title: Additive logratio transformation
### Aliases: ALR ALR.default ALR.compositional

### ** Examples

# logratio plot of trace element concentrations:
data(Namib)
alr <- ALR(Namib$Trace)
pairs(alr[,1:5])
title('log(X/Pb)')



