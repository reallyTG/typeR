library(RobExtremes)


### Name: var
### Title: Generic Functions for the Computation of Functionals
### Aliases: var var-methods var,Gumbel-method var,GPareto-method
###   var,GEV-method var,Pareto-method median median-methods
###   median,Gumbel-method median,GEV-method median,GPareto-method
###   median,Pareto-method IQR IQR-methods IQR,Gumbel-method
###   IQR,GPareto-method IQR,GEV-method IQR,Pareto-method skewness
###   skewness-methods skewness,Gumbel-method skewness,GEV-method
###   skewness,GPareto-method skewness,Pareto-method kurtosis
###   kurtosis-methods kurtosis,Gumbel-method kurtosis,GEV-method
###   kurtosis,GPareto-method kurtosis,Pareto-method Sn Sn-methods
###   Sn,ANY-method Sn,UnivariateDistribution-method Sn,Norm-method
###   Sn,AffLinDistribution-method Sn,GPareto-method Sn,Gammad-method
###   Sn,Weibull-method Sn,GEV-method Sn,Pareto-method
###   Sn,DiscreteDistribution-method Qn Qn-methods Qn,ANY-method
###   Qn,UnivariateDistribution-method Qn,Norm-method
###   Qn,DiscreteDistribution-method Qn,AffLinDistribution-method
### Keywords: methods distribution

### ** Examples

# Variance of Exp(1) distribution
G <- GPareto()
var(G)

#median(Exp())
IQR(G)

## note the timing
system.time(print(Sn(GPareto(shape=0.5,scale=2))))
## No test: 
system.time(print(Sn(as(GPareto(shape=0.5,scale=2),"AbscontDistribution"))))
## End(No test)



