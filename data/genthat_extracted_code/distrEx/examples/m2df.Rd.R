library(distrEx)


### Name: m2df
### Title: Generic function for the computation of clipped second moments
### Aliases: m2df m2df-methods m2df,UnivariateDistribution-method
###   m2df,AbscontDistribution-method m2df,LatticeDistribution-method
###   m2df,AffLinDistribution-method m2df,Binom-method m2df,Pois-method
###   m2df,Norm-method m2df,Exp-method m2df,Chisq-method
### Keywords: methods distribution

### ** Examples

# standard normal distribution
N1 <- Norm()
m2df(N1, 0)

# Poisson distribution
P1 <- Pois(lambda=2)
m2df(P1, 3)
m2df(P1, 3, fun = function(x)sin(x))

# absolutely continuous distribution
D1 <- Norm() + Exp() # convolution
m2df(D1, 2)
m2df(D1, Inf)
E(D1, function(x){x^2})



