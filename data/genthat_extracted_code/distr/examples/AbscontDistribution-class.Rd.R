library(distr)


### Name: AbscontDistribution-class
### Title: Class "AbscontDistribution"
### Aliases: AbscontDistribution-class AffLinDistribution-class
###   AffLinAbscontDistribution-class sqrt,AbscontDistribution-method
###   initialize,AbscontDistribution-method
###   initialize,AffLinAbscontDistribution-method
###   sqrt,AbscontDistribution-method
### Keywords: distribution

### ** Examples

N <-  Norm() # N is a normal distribution with mean=0 and sd=1.
E <-  Exp() # E is an exponential distribution with rate=1.
A1 <-  E+1 # a new absolutely continuous distributions with exact slots d, p, q
A2 <-  A1*3 # a new absolutely continuous distributions with exact slots d, p, q
A3 <- N*0.9 + E*0.1 # a new absolutely continuous distribution with approximated slots d, p, q
r(A3)(1) # one random number generated from this distribution, e.g. -0.7150937
d(A3)(0) # The (approximated) density for x=0 is 0.43799.
p(A3)(0) # The (approximated) probability that x <= 0 is 0.45620.
q(A3)(.1) # The (approximated) 10 percent quantile is -1.06015.
## in RStudio or Jupytier IRKernel, use q.l(.)(.) instead of q(.)(.)



