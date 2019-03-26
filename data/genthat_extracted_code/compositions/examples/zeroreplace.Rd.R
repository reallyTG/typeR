library(compositions)


### Name: zeroreplace
### Title: Zero-replacement routine
### Aliases: zeroreplace
### Keywords: multivariate

### ** Examples

data(SimulatedAmounts)
x <- acomp(sa.lognormals)
xnew <- simulateMissings(x,dl=0.05,knownlimit=FALSE)
xnew
xrep <- zeroreplace(xnew,0.05)
xrep



