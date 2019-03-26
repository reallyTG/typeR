library(distrEx)


### Name: HellingerDist
### Title: Generic function for the computation of the Hellinger distance
###   of two distributions
### Aliases: HellingerDist HellingerDist-methods
###   HellingerDist,AbscontDistribution,AbscontDistribution-method
###   HellingerDist,AbscontDistribution,DiscreteDistribution-method
###   HellingerDist,DiscreteDistribution,DiscreteDistribution-method
###   HellingerDist,DiscreteMVDistribution,DiscreteMVDistribution-method
###   HellingerDist,DiscreteDistribution,AbscontDistribution-method
###   HellingerDist,LatticeDistribution,DiscreteDistribution-method
###   HellingerDist,DiscreteDistribution,LatticeDistribution-method
###   HellingerDist,LatticeDistribution,LatticeDistribution-method
###   HellingerDist,numeric,DiscreteDistribution-method
###   HellingerDist,DiscreteDistribution,numeric-method
###   HellingerDist,numeric,AbscontDistribution-method
###   HellingerDist,AbscontDistribution,numeric-method
###   HellingerDist,AcDcLcDistribution,AcDcLcDistribution-method
### Keywords: distribution

### ** Examples

HellingerDist(Norm(), UnivarMixingDistribution(Norm(1,2),Norm(0.5,3),
                 mixCoeff=c(0.2,0.8)))
HellingerDist(Norm(), Td(10))
HellingerDist(Norm(mean = 50, sd = sqrt(25)), Binom(size = 100)) # mutually singular
HellingerDist(Pois(10), Binom(size = 20)) 

x <- rnorm(100)
HellingerDist(Norm(), x)
HellingerDist(x, Norm(), asis.smooth.discretize = "smooth")

y <- (rbinom(50, size = 20, prob = 0.5)-10)/sqrt(5)
HellingerDist(y, Norm())
HellingerDist(y, Norm(), asis.smooth.discretize = "smooth")

HellingerDist(rbinom(50, size = 20, prob = 0.5), Binom(size = 20, prob = 0.5))



