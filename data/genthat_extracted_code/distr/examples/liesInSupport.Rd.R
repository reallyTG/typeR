library(distr)


### Name: liesInSupport
### Title: Generic Function for Testing the Support of a Distribution
### Aliases: liesInSupport liesInSupport-methods
###   liesInSupport,DiscreteDistribution,numeric-method
###   liesInSupport,DiscreteDistribution,matrix-method
###   liesInSupport,AbscontDistribution,numeric-method
###   liesInSupport,AbscontDistribution,matrix-method
### Keywords: distribution methods

### ** Examples

liesInSupport(Exp(1), rnorm(10))

# note
x <- rpois(10, lam = 10)
liesInSupport(Pois(1), x)
# better
distroptions("TruncQuantile"=1e-15)
liesInSupport(Pois(1), x)
distroptions("TruncQuantile"=1e-05) # default




