library(distr)


### Name: Truncate-methods
### Title: Methods for function Truncate in Package 'distr'
### Aliases: Truncate-methods Truncate Truncate,AbscontDistribution-method
###   Truncate,DiscreteDistribution-method
###   Truncate,LatticeDistribution-method
###   Truncate,UnivarLebDecDistribution-method
### Keywords: distribution methods

### ** Examples

plot(Truncate(Norm(),lower=-1,upper=2))
TN <- Truncate(Norm(),lower=15,upper=15.7) ### remarkably right!
plot(TN)
r(TN)(30)
TNG <- Truncate(Geom(prob=0.05),lower=325,upper=329) ### remarkably right!
plot(TNG)



