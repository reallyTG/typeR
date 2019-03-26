library(distr)


### Name: simplifyr-methods
### Title: Methods for Function simplifyr in Package 'distr'
### Aliases: simplifyr-methods simplifyr
###   simplifyr,UnivariateDistribution-method
### Keywords: math distribution arith

### ** Examples

F <- ( Norm() + Binom() + Pois() + Exp() ) * 2 - 10
system.time(r(F)(10^6))
simplifyr(F, size = 10^6)
system.time(r(F)(10^6))


