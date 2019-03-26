library(distr)


### Name: decomposePM-methods
### Title: Methods for function decomposePM in Package 'distr'
### Aliases: decomposePM-methods decomposePM
###   decomposePM,AbscontDistribution-method
###   decomposePM,DiscreteDistribution-method
###   decomposePM,UnivarLebDecDistribution-method
### Keywords: distribution methods

### ** Examples

decomposePM(Norm())
decomposePM(Binom(2,0.3)-Binom(5,.4))
decomposePM(UnivarLebDecDistribution(Norm(),Binom(2,0.3)-Binom(5,.4), 
            acWeight = 0.3))



