library(distrEx)


### Name: AsymTotalVarDist
### Title: Generic function for the computation of asymmetric total
###   variation distance of two distributions
### Aliases: AsymTotalVarDist AsymTotalVarDist-methods
###   AsymTotalVarDist,AbscontDistribution,AbscontDistribution-method
###   AsymTotalVarDist,AbscontDistribution,DiscreteDistribution-method
###   AsymTotalVarDist,DiscreteDistribution,DiscreteDistribution-method
###   AsymTotalVarDist,DiscreteDistribution,AbscontDistribution-method
###   AsymTotalVarDist,LatticeDistribution,DiscreteDistribution-method
###   AsymTotalVarDist,DiscreteDistribution,LatticeDistribution-method
###   AsymTotalVarDist,LatticeDistribution,LatticeDistribution-method
###   AsymTotalVarDist,numeric,DiscreteDistribution-method
###   AsymTotalVarDist,DiscreteDistribution,numeric-method
###   AsymTotalVarDist,numeric,AbscontDistribution-method
###   AsymTotalVarDist,AbscontDistribution,numeric-method
###   AsymTotalVarDist,AcDcLcDistribution,AcDcLcDistribution-method
### Keywords: distribution

### ** Examples

AsymTotalVarDist(Norm(), UnivarMixingDistribution(Norm(1,2),Norm(0.5,3),
                 mixCoeff=c(0.2,0.8)), rho=0.3)
AsymTotalVarDist(Norm(), Td(10), rho=0.3)
AsymTotalVarDist(Norm(mean = 50, sd = sqrt(25)), Binom(size = 100), rho=0.3) # mutually singular
AsymTotalVarDist(Pois(10), Binom(size = 20), rho=0.3) 

x <- rnorm(100)
AsymTotalVarDist(Norm(), x, rho=0.3)
AsymTotalVarDist(x, Norm(), asis.smooth.discretize = "smooth", rho=0.3)

y <- (rbinom(50, size = 20, prob = 0.5)-10)/sqrt(5)
AsymTotalVarDist(y, Norm(), rho=0.3)
AsymTotalVarDist(y, Norm(), asis.smooth.discretize = "smooth", rho=0.3)

AsymTotalVarDist(rbinom(50, size = 20, prob = 0.5), Binom(size = 20, prob = 0.5), rho=0.3)



