library(FixedPoint)


### Name: EpsilonExtrapolation
### Title: EpsilonExtrapolation This function takes a matrix with previous
###   iterates and extrapolates the limit of the sequence.
### Aliases: EpsilonExtrapolation

### ** Examples

FPFunction = function(x){c(0.5*sqrt(abs(x[1] + x[2])), 1.5*x[1] + 0.5*x[2])}
A = FixedPoint( Function = FPFunction, Inputs = c(0.3,900), MaxIter = 6, Method = "Simple")
Iterates = PutTogetherIteratesWithoutJumps(A$Inputs, A$Outputs)
EpsilonExtrapolation(Iterates, "VEA")
B = FixedPoint( function(x){cos(x)}, Inputs = 1, MaxIter = 5, Method = "Simple")
Iterates = PutTogetherIteratesWithoutJumps(B$Inputs, B$Outputs)
EpsilonExtrapolation(Iterates, "SEA")



