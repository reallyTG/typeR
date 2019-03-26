library(FuzzyNumbers)


### Name: necessityUndervaluation
### Title: Necessity of undervaluation
### Aliases: necessityUndervaluation
###   necessityUndervaluation,PiecewiseLinearFuzzyNumber,PiecewiseLinearFuzzyNumber-method

### ** Examples

a <- TriangularFuzzyNumber(0.2, 1.0, 2.8)
b <- TriangularFuzzyNumber(0, 1.8, 2.2)
a <- as.PiecewiseLinearFuzzyNumber(a, knot.n = 9)
b <- as.PiecewiseLinearFuzzyNumber(b, knot.n = 9)
necessityUndervaluation(a,b)



