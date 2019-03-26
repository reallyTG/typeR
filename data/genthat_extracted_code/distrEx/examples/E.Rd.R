library(distrEx)


### Name: E
### Title: Generic Function for the Computation of (Conditional)
###   Expectations
### Aliases: E E-methods E,UnivariateDistribution,missing,missing-method
###   E,AbscontDistribution,missing,missing-method
###   E,DiscreteDistribution,missing,missing-method
###   E,LatticeDistribution,missing,missing-method
###   E,AffLinDistribution,missing,missing-method
###   E,AffLinAbscontDistribution,missing,missing-method
###   E,AffLinDiscreteDistribution,missing,missing-method
###   E,AffLinLatticeDistribution,missing,missing-method
###   E,MultivariateDistribution,missing,missing-method
###   E,DiscreteMVDistribution,missing,missing-method
###   E,UnivarLebDecDistribution,missing,missing-method
###   E,AffLinUnivarLebDecDistribution,missing,missing-method
###   E,UnivarMixingDistribution,missing,missing-method
###   E,UnivariateDistribution,function,missing-method
###   E,AbscontDistribution,function,missing-method
###   E,DiscreteDistribution,function,missing-method
###   E,LatticeDistribution,function,missing-method
###   E,MultivariateDistribution,function,missing-method
###   E,DiscreteMVDistribution,function,missing-method
###   E,UnivarLebDecDistribution,function,missing-method
###   E,UnivarMixingDistribution,function,missing-method
###   E,AcDcLcDistribution,ANY,ANY-method
###   E,CompoundDistribution,missing,missing-method
###   E,UnivariateCondDistribution,missing,numeric-method
###   E,AbscontCondDistribution,missing,numeric-method
###   E,DiscreteCondDistribution,missing,numeric-method
###   E,UnivarLebDecDistribution,missing,ANY-method
###   E,UnivarMixingDistribution,missing,ANY-method
###   E,UnivarLebDecDistribution,function,ANY-method
###   E,UnivariateCondDistribution,function,numeric-method
###   E,UnivarMixingDistribution,function,ANY-method
###   E,AbscontCondDistribution,function,numeric-method
###   E,DiscreteCondDistribution,function,numeric-method
###   E,Arcsine,missing,missing-method E,Beta,missing,missing-method
###   E,Binom,missing,missing-method E,Cauchy,missing,missing-method
###   E,Chisq,missing,missing-method E,Dirac,missing,missing-method
###   E,DExp,missing,missing-method E,Exp,missing,missing-method
###   E,Fd,missing,missing-method E,Gammad,missing,missing-method
###   E,Gammad,function,missing-method E,Geom,missing,missing-method
###   E,Gumbel,missing,missing-method E,GPareto,missing,missing-method
###   E,GPareto,function,missing-method E,GEV,missing,missing-method
###   E,GEV,function,missing-method E,Hyper,missing,missing-method
###   E,Logis,missing,missing-method E,Lnorm,missing,missing-method
###   E,Nbinom,missing,missing-method E,Norm,missing,missing-method
###   E,Pareto,missing,missing-method E,Pois,missing,missing-method
###   E,Td,missing,missing-method E,Unif,missing,missing-method
###   E,Weibull,missing,missing-method
### Keywords: methods distribution

### ** Examples

# mean of Exp(1) distribution
E <- Exp() 

E(E) ## uses explicit terms
E(as(E,"AbscontDistribution")) ## uses numerical integration
E(as(E,"UnivariateDistribution")) ## uses simulations
E(E, fun = function(x){2*x^2}) ## uses simulations

# the same operator for discrete distributions:
P <- Pois(lambda=2)

E(P) ## uses explicit terms
E(as(P,"DiscreteDistribution")) ## uses sums
E(as(P,"UnivariateDistribution")) ## uses simulations
E(P, fun = function(x){2*x^2}) ## uses simulations


# second moment of N(1,4)
E(Norm(mean=1, sd=2), fun = function(x){x^2})
E(Norm(mean=1, sd=2), fun = function(x){x^2}, useApply = FALSE)

# conditional distribution of a linear model
D1 <- LMCondDistribution(theta = 1) 
E(D1, cond = 1)
E(Norm(mean=1))
E(D1, function(x){x^2}, cond = 1)
E(Norm(mean=1), fun = function(x){x^2})
E(D1, function(x, cond){cond*x^2}, cond = 2, withCond = TRUE, useApply = FALSE)
E(Norm(mean=2), function(x){2*x^2})

E(as(Norm(mean=2),"AbscontDistribution"))
### somewhat less accurate:
E(as(Norm(mean=2),"AbscontDistribution"), 
     lowerTruncQuantil=1e-4,upperTruncQuantil=1e-4, IQR.fac= 4)
### even less accurate:
E(as(Norm(mean=2),"AbscontDistribution"), 
     lowerTruncQuantil=1e-2,upperTruncQuantil=1e-2, IQR.fac= 4)
### no good idea, but just as an example:
E(as(Norm(mean=2),"AbscontDistribution"), 
     lowerTruncQuantil=1e-2,upperTruncQuantil=1e-2, IQR.fac= .1)

### truncation of integration range; see also m1df...
E(Norm(mean=2), low=2,upp=4)

E(Cauchy())
E(Cauchy(),upp=3,low=-2)
# some Lebesgue decomposed distribution 
mymix <- UnivarLebDecDistribution(acPart = Norm(), discretePart = Binom(4,.4),
         acWeight = 0.4)
E(mymix)



