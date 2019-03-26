library(distr)


### Name: LatticeDistribution-class
### Title: Class "LatticeDistribution"
### Aliases: AffLinLatticeDistribution-class LatticeDistribution-class
###   lattice lattice-method lattice,LatticeDistribution-method
###   initialize,LatticeDistribution-method
###   initialize,AffLinLatticeDistribution-method
###   sqrt,LatticeDistribution-method
###   coerce,LatticeDistribution,DiscreteDistribution-method
###   coerce,AffLinLatticeDistribution,AffLinDiscreteDistribution-method
### Keywords: distribution

### ** Examples

B <- Binom(prob = 0.1,size = 10) # B is a Binomial distribution w/ prob=0.1 and size=10.
P <- Pois(lambda = 1) # P is a Poisson distribution with lambda = 1.
D1 <- B+1 # a new Lattice distributions with exact slots d, p, q
D2 <- D1*3 # a new Lattice distributions with exact slots d, p, q
D3 <- B+P # a new Lattice distributions with approximated slots d, p, q
D4 <- D1+P # a new Lattice distributions with approximated slots d, p, q
support(D4) # the (approximated) support of this distribution is 1, 2, ..., 21
r(D4)(1) # one random number generated from this distribution, e.g. 4
d(D4)(1) # The (approximated) density for x=1 is 0.1282716.
p(D4)(1) # The (approximated) probability that x<=1 is 0.1282716.
q(D4)(.5) # The (approximated) 50 percent quantile is 3.
## in RStudio or Jupyter IRKernel, use q.l(.)(.) instead of q(.)(.)



