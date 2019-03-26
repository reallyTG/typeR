library(distr)


### Name: operators-methods
### Title: Methods for operators +,-,*,/,... in Package distr
### Aliases: operators-methods operators
###   -,UnivariateDistribution,missing-method
###   -,LatticeDistribution,missing-method -,Norm,missing-method
###   +,UnivariateDistribution,numeric-method
###   +,AbscontDistribution,numeric-method
###   +,DiscreteDistribution,numeric-method
###   +,LatticeDistribution,numeric-method
###   +,UnivarLebDecDistribution,numeric-method
###   +,AffLinAbscontDistribution,numeric-method
###   +,AffLinDiscreteDistribution,numeric-method
###   +,AffLinLatticeDistribution,numeric-method
###   +,AffLinUnivarLebDecDistribution,numeric-method
###   +,CompoundDistribution,numeric-method +,Cauchy,numeric-method
###   +,Dirac,numeric-method +,Norm,numeric-method +,Unif,numeric-method
###   +,numeric,UnivariateDistribution-method
###   +,numeric,LatticeDistribution-method
###   -,UnivariateDistribution,numeric-method
###   -,UnivariateDistribution,UnivariateDistribution-method
###   -,LatticeDistribution,numeric-method
###   -,LatticeDistribution,LatticeDistribution-method
###   -,LatticeDistribution,UnivariateDistribution-method
###   -,UnivariateDistribution,LatticeDistribution-method
###   -,AcDcLcDistribution,AcDcLcDistribution-method
###   -,numeric,UnivariateDistribution-method
###   -,numeric,LatticeDistribution-method
###   *,UnivariateDistribution,numeric-method
###   *,AbscontDistribution,numeric-method
###   *,DiscreteDistribution,numeric-method
###   *,LatticeDistribution,numeric-method
###   *,UnivarLebDecDistribution,numeric-method
###   *,CompoundDistribution,numeric-method
###   *,AffLinAbscontDistribution,numeric-method
###   *,AffLinDiscreteDistribution,numeric-method
###   *,AffLinLatticeDistribution,numeric-method
###   *,AffLinUnivarLebDecDistribution,numeric-method *,DExp,numeric-method
###   *,Exp,numeric-method *,ExpOrGammaOrChisq,numeric-method
###   *,Weibull,numeric-method *,Cauchy,numeric-method
###   *,Dirac,numeric-method *,Norm,numeric-method *,Logis,numeric-method
###   *,Lnorm,numeric-method *,Unif,numeric-method
###   *,numeric,UnivariateDistribution-method
###   *,numeric,LatticeDistribution-method
###   /,UnivariateDistribution,numeric-method
###   /,LatticeDistribution,numeric-method
###   +,UnivariateDistribution,UnivariateDistribution-method
###   +,AbscontDistribution,AbscontDistribution-method
###   +,AbscontDistribution,DiscreteDistribution-method
###   +,DiscreteDistribution,AbscontDistribution-method
###   +,DiscreteDistribution,DiscreteDistribution-method
###   +,LatticeDistribution,DiscreteDistribution-method
###   +,LatticeDistribution,LatticeDistribution-method
###   +,UnivarLebDecDistribution,UnivarLebDecDistribution-method
###   +,AcDcLcDistribution,AcDcLcDistribution-method +,Binom,Binom-method
###   +,Cauchy,Cauchy-method +,Chisq,Chisq-method +,Dirac,Dirac-method
###   +,ExpOrGammaOrChisq,ExpOrGammaOrChisq-method +,Pois,Pois-method
###   +,Nbinom,Nbinom-method +,Norm,Norm-method +,Logis,numeric-method
###   +,Dirac,UnivariateDistribution-method
###   +,Dirac,DiscreteDistribution-method
###   +,UnivariateDistribution,Dirac-method -,numeric,Beta-method
###   -,Dirac,Dirac-method *,Dirac,Dirac-method
###   *,Dirac,UnivariateDistribution-method
###   *,UnivariateDistribution,Dirac-method
###   *,AcDcLcDistribution,AcDcLcDistribution-method /,Dirac,Dirac-method
###   /,numeric,Dirac-method /,numeric,AcDcLcDistribution-method
###   /,AcDcLcDistribution,AcDcLcDistribution-method
###   ^,AcDcLcDistribution,numeric-method
###   ^,AcDcLcDistribution,Integer-method
###   ^,AcDcLcDistribution,AcDcLcDistribution-method
###   ^,numeric,AcDcLcDistribution-method
### Keywords: math distribution arith

### ** Examples

N <- Norm(0,3)
P <- Pois(4)
a <- 3
N + a
N + P
N - a
a * N
a * P
N / a + sin( a * P - N)
N * P
N / N
## Not run: 
##D ## takes a little time
##D N ^ P
## End(Not run)
1.2 ^ N
abs(N) ^ 1.3



