library(FuzzyNumbers)


### Name: possibilityStrictUndervaluation
### Title: Possibility of strict undervaluation
### Aliases: possibilityStrictUndervaluation
###   possibilityStrictUndervaluation,PiecewiseLinearFuzzyNumber,PiecewiseLinearFuzzyNumber-method

### ** Examples

a <- TriangularFuzzyNumber(0.2, 1.0, 2.8)
b <- TriangularFuzzyNumber(0, 1.8, 2.2)
a <- as.PiecewiseLinearFuzzyNumber(a, knot.n = 9)
b <- as.PiecewiseLinearFuzzyNumber(b, knot.n = 9)
possibilityStrictUndervaluation(a,b)



