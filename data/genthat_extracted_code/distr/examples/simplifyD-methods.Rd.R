library(distr)


### Name: simplifyD-methods
### Title: Methods for function simplifyD in Package 'distr'
### Aliases: simplifyD-methods simplifyD
###   simplifyD,AbscontDistribution-method
###   simplifyD,DiscreteDistribution-method
###   simplifyD,UnivarLebDecDistribution-method
###   simplifyD,UnivarMixingDistribution-method
### Keywords: distribution methods

### ** Examples

set.seed(123)
Mix1 <- UnivarMixingDistribution(Norm(),Binom(2,.3),
  UnivarLebDecDistribution(acPart = Chisq(df = 2), discretePart = Nbinom(3,.09),
                           acWeight = 0.3),
  Norm()-Chisq(df=3), mixCoeff=c(0,0,0.2,0.8), withSimplify = FALSE)
Mix2 <- UnivarMixingDistribution(Norm(),Mix1, DExp(2),
        mixCoeff = c(0,0.2,0.8), withSimplify = FALSE)
Mix2        
simplifyD(Mix2)



