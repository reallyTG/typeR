library(distrEx)


### Name: m1df
### Title: Generic Function for the Computation of Clipped First Moments
### Aliases: m1df m1df-methods m1df,UnivariateDistribution-method
###   m1df,AbscontDistribution-method m1df,LatticeDistribution-method
###   m1df,AffLinDistribution-method m1df,Binom-method m1df,Pois-method
###   m1df,Norm-method m1df,Exp-method m1df,Chisq-method
### Keywords: distribution methods

### ** Examples

# standard normal distribution
N1 <- Norm()
m1df(N1, 0)

# Poisson distribution
P1 <- Pois(lambda=2)
m1df(P1, 3)
m1df(P1, 3, fun = function(x)sin(x))

# absolutely continuous distribution
D1 <- Norm() + Exp() # convolution
m1df(D1, 2)
m1df(D1, Inf)
E(D1)



