library(EMMIXuskew)


### Name: fmmt
### Title: Fitting Finite Mixtures of Unrestricted Multivariate t
###   Distributions
### Aliases: fmmt summary.fmmt print.fmmt
### Keywords: EM algorithm multivariate skew t maximum likleihood
###   estimation

### ** Examples

#a short demo using AIS data
data(ais)
Fit <- fmmt(2, ais[,c(2,12)], itmax=10)
summary(Fit)
print(Fit)



