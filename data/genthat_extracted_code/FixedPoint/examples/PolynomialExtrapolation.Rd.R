library(FixedPoint)


### Name: PolynomialExtrapolation
### Title: PolynomialExtrapolation This function performs Minimal
###   Polynomial extrapolation (MPE) or Reduced Rank Extrapolation (RRE)
###   given a matrix of previous iterates of the function.
### Aliases: PolynomialExtrapolation

### ** Examples

FPFunction = function(x){c(0.5*sqrt(abs(x[1] + x[2])), 1.5*x[1] + 0.5*x[2])}
A = FixedPoint( Function = FPFunction, Inputs = c(0.3,900), MaxIter = 6, Method = "Simple")
Iterates = PutTogetherIteratesWithoutJumps(A$Inputs, A$Outputs)
PolynomialExtrapolation(Iterates, "MPE")
B = FixedPoint( function(x){cos(x)}, Inputs = 1, MaxIter = 5, Method = "Simple")
Iterates = PutTogetherIteratesWithoutJumps(B$Inputs, B$Outputs)
PolynomialExtrapolation(Iterates, "RRE")



