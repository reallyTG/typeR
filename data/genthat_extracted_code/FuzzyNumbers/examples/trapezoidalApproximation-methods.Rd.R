library(FuzzyNumbers)


### Name: trapezoidalApproximation
### Title: Trapezoidal Approximation of a Fuzzy Number
### Aliases: trapezoidalApproximation
###   trapezoidalApproximation,FuzzyNumber-method

### ** Examples

(A <- FuzzyNumber(-1, 0, 1, 40,
   lower=function(x) sqrt(x), upper=function(x) 1-sqrt(x)))
(TA <- trapezoidalApproximation(A,
   "ExpectedIntervalPreserving")) # Note that the cores are disjoint!
expectedInterval(A)
expectedInterval(TA)



