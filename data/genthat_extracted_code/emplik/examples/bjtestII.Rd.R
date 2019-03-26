library(emplik)


### Name: bjtestII
### Title: Alternative test of the Buckley-James estimator by Empirical
###   Likelihood
### Aliases: bjtestII
### Keywords: nonparametric htest

### ** Examples

data(myeloma)
bjtestII(y=myeloma[,1], d=myeloma[,2], x=cbind(1, myeloma[,3]), beta=c(37, -3.4))



