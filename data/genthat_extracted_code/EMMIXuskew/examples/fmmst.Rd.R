library(EMMIXuskew)


### Name: fmmst
### Title: Fitting Finite Mixtures of Unrestricted Multivariate Skew t
###   Distributions
### Aliases: fmmst summary.fmmst print.fmmst
### Keywords: EM algorithm multivariate skew t maximum likelihood
###   estimation

### ** Examples

#a short demo using AIS data
data(ais)
Fit <- fmmst(2, ais[,c(2,12)], itmax=5) 
summary(Fit)
print(Fit)



