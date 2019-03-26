library(distrEx)


### Name: OAsymTotalVarDist
### Title: Generic function for the computation of (minimal) asymmetric
###   total variation distance of two distributions
### Aliases: OAsymTotalVarDist OAsymTotalVarDist-methods
###   OAsymTotalVarDist,AbscontDistribution,AbscontDistribution-method
###   OAsymTotalVarDist,AbscontDistribution,DiscreteDistribution-method
###   OAsymTotalVarDist,DiscreteDistribution,DiscreteDistribution-method
###   OAsymTotalVarDist,DiscreteDistribution,AbscontDistribution-method
###   OAsymTotalVarDist,LatticeDistribution,DiscreteDistribution-method
###   OAsymTotalVarDist,DiscreteDistribution,LatticeDistribution-method
###   OAsymTotalVarDist,LatticeDistribution,LatticeDistribution-method
###   OAsymTotalVarDist,numeric,DiscreteDistribution-method
###   OAsymTotalVarDist,DiscreteDistribution,numeric-method
###   OAsymTotalVarDist,numeric,AbscontDistribution-method
###   OAsymTotalVarDist,AbscontDistribution,numeric-method
###   OAsymTotalVarDist,AcDcLcDistribution,AcDcLcDistribution-method
### Keywords: distribution

### ** Examples

OAsymTotalVarDist(Norm(), UnivarMixingDistribution(Norm(1,2),Norm(0.5,3),
                 mixCoeff=c(0.2,0.8)))
OAsymTotalVarDist(Norm(), Td(10))
OAsymTotalVarDist(Norm(mean = 50, sd = sqrt(25)), Binom(size = 100)) # mutually singular
OAsymTotalVarDist(Pois(10), Binom(size = 20)) 

x <- rnorm(100)
OAsymTotalVarDist(Norm(), x)
OAsymTotalVarDist(x, Norm(), asis.smooth.discretize = "smooth")

y <- (rbinom(50, size = 20, prob = 0.5)-10)/sqrt(5)
OAsymTotalVarDist(y, Norm())
OAsymTotalVarDist(y, Norm(), asis.smooth.discretize = "smooth")

OAsymTotalVarDist(rbinom(50, size = 20, prob = 0.5), Binom(size = 20, prob = 0.5))



