library(distrEx)


### Name: TotalVarDist
### Title: Generic function for the computation of the total variation
###   distance of two distributions
### Aliases: TotalVarDist TotalVarDist-methods
###   TotalVarDist,AbscontDistribution,AbscontDistribution-method
###   TotalVarDist,AbscontDistribution,DiscreteDistribution-method
###   TotalVarDist,DiscreteDistribution,DiscreteDistribution-method
###   TotalVarDist,DiscreteMVDistribution,DiscreteMVDistribution-method
###   TotalVarDist,DiscreteDistribution,AbscontDistribution-method
###   TotalVarDist,LatticeDistribution,DiscreteDistribution-method
###   TotalVarDist,DiscreteDistribution,LatticeDistribution-method
###   TotalVarDist,LatticeDistribution,LatticeDistribution-method
###   TotalVarDist,numeric,DiscreteDistribution-method
###   TotalVarDist,DiscreteDistribution,numeric-method
###   TotalVarDist,numeric,AbscontDistribution-method
###   TotalVarDist,AbscontDistribution,numeric-method
###   TotalVarDist,AcDcLcDistribution,AcDcLcDistribution-method
### Keywords: distribution

### ** Examples

TotalVarDist(Norm(), UnivarMixingDistribution(Norm(1,2),Norm(0.5,3),
                 mixCoeff=c(0.2,0.8)))
TotalVarDist(Norm(), Td(10))
TotalVarDist(Norm(mean = 50, sd = sqrt(25)), Binom(size = 100)) # mutually singular
TotalVarDist(Pois(10), Binom(size = 20)) 

x <- rnorm(100)
TotalVarDist(Norm(), x)
TotalVarDist(x, Norm(), asis.smooth.discretize = "smooth")

y <- (rbinom(50, size = 20, prob = 0.5)-10)/sqrt(5)
TotalVarDist(y, Norm())
TotalVarDist(y, Norm(), asis.smooth.discretize = "smooth")

TotalVarDist(rbinom(50, size = 20, prob = 0.5), Binom(size = 20, prob = 0.5))



