library(FuzzyNumbers)


### Name: necessityStrictExceedance
### Title: Necessity of strict exceedance
### Aliases: necessityStrictExceedance
###   necessityStrictExceedance,PiecewiseLinearFuzzyNumber,PiecewiseLinearFuzzyNumber-method

### ** Examples

a <- TriangularFuzzyNumber(2, 3, 5)
b <- TriangularFuzzyNumber(1.5, 4, 4.8)
a <- as.PiecewiseLinearFuzzyNumber(a, knot.n = 9)
b <- as.PiecewiseLinearFuzzyNumber(b, knot.n = 9)
necessityStrictExceedance(a,b)



