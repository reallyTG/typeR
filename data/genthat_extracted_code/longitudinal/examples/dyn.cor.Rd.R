library(longitudinal)


### Name: dyn.cor
### Title: Dynamical Correlation and Covariance
### Aliases: dyn.cor dyn.pcor dyn.invcor dyn.cov dyn.pvar dyn.var
###   dyn.invcov
### Keywords: multivariate

### ** Examples

# load "longitudinal" library
library("longitudinal")

# load tcell data
data(tcell)
get.time.repeats(tcell.34)


# dynamical partial correlation 
# (this takes into account of the unequal spacings between time points) 
dynpc <- dyn.pcor(tcell.34, lambda=0)

# static partial correlation
statpc <- pcor.shrink(tcell.34, lambda=0)

# this is NOT the same
sum((dynpc - statpc)^2)




