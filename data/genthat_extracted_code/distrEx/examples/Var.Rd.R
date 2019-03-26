library(distrEx)


### Name: var
### Title: Generic Functions for the Computation of Functionals
### Aliases: var var-methods var,ANY-method
###   var,UnivariateDistribution-method var,AffLinDistribution-method
###   var,AffLinAbscontDistribution-method
###   var,AffLinDiscreteDistribution-method
###   var,AffLinLatticeDistribution-method var,CompoundDistribution-method
###   var,Arcsine-method var,Beta-method var,Binom-method var,Cauchy-method
###   var,Chisq-method var,Dirac-method var,DExp-method var,Exp-method
###   var,Fd-method var,Gammad-method var,Geom-method var,Hyper-method
###   var,Logis-method var,Lnorm-method var,Nbinom-method var,Norm-method
###   var,Pois-method var,Unif-method var,Weibull-method var,Td-method sd
###   sd-methods sd,UnivariateDistribution-method sd,Norm-method median
###   median,ANY-method median-methods median,UnivariateDistribution-method
###   median,UnivariateCondDistribution-method
###   median,AffLinDistribution-method
###   median,AffLinAbscontDistribution-method
###   median,AffLinDiscreteDistribution-method
###   median,AffLinLatticeDistribution-method median,Arcsine-method
###   median,Cauchy-method median,Dirac-method median,DExp-method
###   median,Exp-method median,Geom-method median,Logis-method
###   median,Lnorm-method median,Norm-method median,Unif-method IQR
###   IQR-methods IQR,ANY-method IQR,UnivariateDistribution-method
###   IQR,UnivariateCondDistribution-method IQR,AffLinDistribution-method
###   IQR,AffLinAbscontDistribution-method
###   IQR,AffLinDiscreteDistribution-method
###   IQR,AffLinLatticeDistribution-method IQR,DiscreteDistribution-method
###   IQR,Arcsine-method IQR,Cauchy-method IQR,Dirac-method IQR,DExp-method
###   IQR,Exp-method IQR,Geom-method IQR,Logis-method IQR,Norm-method
###   IQR,Unif-method mad mad,ANY-method mad-methods
###   mad,UnivariateDistribution-method mad,AffLinDistribution-method
###   mad,AffLinAbscontDistribution-method
###   mad,AffLinDiscreteDistribution-method
###   mad,AffLinLatticeDistribution-method mad,Cauchy-method
###   mad,Dirac-method mad,DExp-method mad,Exp-method mad,Geom-method
###   mad,Logis-method mad,Norm-method mad,Unif-method mad,Arcsine-method
###   skewness skewness-methods skewness,ANY-method
###   skewness,UnivariateDistribution-method
###   skewness,AffLinDistribution-method
###   skewness,AffLinAbscontDistribution-method
###   skewness,AffLinDiscreteDistribution-method
###   skewness,AffLinLatticeDistribution-method skewness,Arcsine-method
###   skewness,Beta-method skewness,Binom-method skewness,Cauchy-method
###   skewness,Chisq-method skewness,Dirac-method skewness,DExp-method
###   skewness,Exp-method skewness,Fd-method skewness,Gammad-method
###   skewness,Geom-method skewness,Hyper-method skewness,Logis-method
###   skewness,Lnorm-method skewness,Nbinom-method skewness,Norm-method
###   skewness,Pois-method skewness,Unif-method skewness,Weibull-method
###   skewness,Td-method kurtosis kurtosis-methods kurtosis,ANY-method
###   kurtosis,UnivariateDistribution-method
###   kurtosis,AffLinDistribution-method
###   kurtosis,AffLinAbscontDistribution-method
###   kurtosis,AffLinDiscreteDistribution-method
###   kurtosis,AffLinLatticeDistribution-method kurtosis,Arcsine-method
###   kurtosis,Beta-method kurtosis,Binom-method kurtosis,Cauchy-method
###   kurtosis,Chisq-method kurtosis,Dirac-method kurtosis,DExp-method
###   kurtosis,Exp-method kurtosis,Fd-method kurtosis,Gammad-method
###   kurtosis,Geom-method kurtosis,Hyper-method kurtosis,Logis-method
###   kurtosis,Lnorm-method kurtosis,Nbinom-method kurtosis,Norm-method
###   kurtosis,Pois-method kurtosis,Unif-method kurtosis,Weibull-method
###   kurtosis,Td-method
### Keywords: methods distribution

### ** Examples

# Variance of Exp(1) distribution
var(Exp())

#median(Exp())
IQR(Exp())
mad(Exp())

# Variance of N(1,4)^2
var(Norm(mean=1, sd=2), fun = function(x){x^2})
var(Norm(mean=1, sd=2), fun = function(x){x^2}, useApply = FALSE)

## sd -- may equivalently be replaced by var
sd(Pois()) ## uses explicit terms
sd(as(Pois(),"DiscreteDistribution")) ## uses sums
sd(as(Pois(),"UnivariateDistribution")) ## uses simulations
sd(Norm(mean=2), fun = function(x){2*x^2}) ## uses simulations
#
mad(sin(exp(Norm()+2*Pois()))) ## weird



