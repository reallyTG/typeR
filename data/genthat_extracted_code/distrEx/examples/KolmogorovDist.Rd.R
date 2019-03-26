library(distrEx)


### Name: KolmogorovDist
### Title: Generic function for the computation of the Kolmogorov distance
###   of two distributions
### Aliases: KolmogorovDist KolmogorovDist-methods
###   KolmogorovDist,AbscontDistribution,AbscontDistribution-method
###   KolmogorovDist,AbscontDistribution,DiscreteDistribution-method
###   KolmogorovDist,DiscreteDistribution,DiscreteDistribution-method
###   KolmogorovDist,DiscreteDistribution,AbscontDistribution-method
###   KolmogorovDist,LatticeDistribution,DiscreteDistribution-method
###   KolmogorovDist,DiscreteDistribution,LatticeDistribution-method
###   KolmogorovDist,LatticeDistribution,LatticeDistribution-method
###   KolmogorovDist,numeric,UnivariateDistribution-method
###   KolmogorovDist,UnivariateDistribution,numeric-method
###   KolmogorovDist,AcDcLcDistribution,AcDcLcDistribution-method
### Keywords: distribution

### ** Examples

KolmogorovDist(Norm(), UnivarMixingDistribution(Norm(1,2),Norm(0.5,3),
                 mixCoeff=c(0.2,0.8)))
KolmogorovDist(Norm(), Td(10))
KolmogorovDist(Norm(mean = 50, sd = sqrt(25)), Binom(size = 100))
KolmogorovDist(Pois(10), Binom(size = 20)) 
KolmogorovDist(Norm(), rnorm(100))
KolmogorovDist((rbinom(50, size = 20, prob = 0.5)-10)/sqrt(5), Norm())
KolmogorovDist(rbinom(50, size = 20, prob = 0.5), Binom(size = 20, prob = 0.5))



