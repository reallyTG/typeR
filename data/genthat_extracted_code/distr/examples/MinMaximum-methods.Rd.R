library(distr)


### Name: Minimum-methods
### Title: Methods for functions Minimum and Maximum in Package 'distr'
### Aliases: Minimum-methods Minimum Maximum-methods Maximum
###   Minimum,AbscontDistribution,AbscontDistribution-method
###   Minimum,DiscreteDistribution,DiscreteDistribution-method
###   Minimum,AbscontDistribution,Dirac-method
###   Minimum,AcDcLcDistribution,AcDcLcDistribution-method
###   Minimum,AbscontDistribution,numeric-method
###   Minimum,DiscreteDistribution,numeric-method
###   Minimum,AcDcLcDistribution,numeric-method
###   Maximum,AcDcLcDistribution,AcDcLcDistribution-method
###   Maximum,AcDcLcDistribution,numeric-method
### Keywords: distribution methods

### ** Examples

plot(Maximum(Unif(0,1), Minimum(Unif(0,1), Unif(0,1))))
plot(Minimum(Exp(4),4))
## a sometimes lengthy example...
## Not run: plot(Minimum(Norm(),Pois()))



