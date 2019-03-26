library(distr)


### Name: DiscreteDistribution-class
### Title: Class "DiscreteDistribution"
### Aliases: DiscreteDistribution-class AffLinDiscreteDistribution-class
###   initialize,DiscreteDistribution-method
###   initialize,AffLinDiscreteDistribution-method
###   sqrt,DiscreteDistribution-method
###   coerce,DiscreteDistribution,LatticeDistribution-method
###   coerce,AffLinDiscreteDistribution,LatticeDistribution-method
### Keywords: distribution

### ** Examples

# Dirac-measure at 0
D1 <- DiscreteDistribution(supp = 0)
support(D1)

# simple discrete distribution
D2 <- DiscreteDistribution(supp = c(1:5), prob = c(0.1, 0.2, 0.3, 0.2, 0.2))
plot(D2)
(pp <- p(D2)(support(D2)))
p(D2)(support(D2)-1e-5)
p(D2)(support(D2)+1e-5)
p.l(D2)(support(D2))
p.l(D2)(support(D2)-1e-5)
p.l(D2)(support(D2)+1e-5)
q(D2)(pp)
q(D2)(pp-1e-5)
q(D2)(pp+1e-5)
## in RStudio or Jupyter IRKernel, use q.l(.)(.) instead of q(.)(.)
q.r(D2)(pp)
q.r(D2)(pp-1e-5)
q.r(D2)(pp+1e-5)



