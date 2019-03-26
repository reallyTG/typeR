library(FuzzyNumbers)


### Name: piecewiseLinearApproximation
### Title: Piecewise Linear Approximation of a Fuzzy Number
### Aliases: piecewiseLinearApproximation
###   piecewiseLinearApproximation,FuzzyNumber-method

### ** Examples

(A <- FuzzyNumber(-1, 0, 1, 3,
   lower=function(x) sqrt(x),upper=function(x) 1-sqrt(x)))
(PA <- piecewiseLinearApproximation(A, "NearestEuclidean",
   knot.n=1, knot.alpha=0.2))



