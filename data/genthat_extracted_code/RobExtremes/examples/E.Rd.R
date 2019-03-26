library(RobExtremes)


### Name: E
### Title: Generic Function for the Computation of (Conditional)
###   Expectations
### Aliases: E DistributionsIntegratingByQuantiles-class E-methods
###   E,DistributionsIntegratingByQuantiles,function,missing-method
###   E,Gumbel,missing,missing-method E,GPareto,missing,missing-method
###   E,GPareto,function,missing-method E,GEV,function,missing-method
###   E,Weibull,function,missing-method E,GEV,missing,missing-method
###   E,Pareto,missing,missing-method E,Gammad,function,missing-method
###   E,Pareto,function,missing-method
### Keywords: methods distribution

### ** Examples

GP <- GPareto(shape=0.3)

E(GP)
E(GP, fun = function(x){2*x^2}) ## uses the log trafo

P <- Pareto()
E(P)
E(P,fun = function(x){1/(x^2+1)})




