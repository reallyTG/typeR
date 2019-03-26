library(FixedPoint)


### Name: PutTogetherIteratesWithoutJumps
### Title: PutTogetherIteratesWithoutJumps This function takes the previous
###   inputs and outputs and assembles a matrix with both excluding jumps.
### Aliases: PutTogetherIteratesWithoutJumps

### ** Examples

A = FixedPoint( function(x){c(0.5*sqrt(abs(x[1] + x[2])), 1.5*x[1] + 0.5*x[2])},
Inputs = c(0.3,900), MaxIter = 5, Method = "Simple")
A = FixedPoint( function(x){c(0.5*sqrt(abs(x[1] + x[2])), 1.5*x[1] + 0.5*x[2])},
Inputs = A$Inputs, Outputs = A$Outputs, MaxIter = 5, Method = "Aitken")
A = FixedPoint( function(x){c(0.5*sqrt(abs(x[1] + x[2])), 1.5*x[1] + 0.5*x[2])},
Inputs = A$Inputs, Outputs = A$Outputs, MaxIter = 5, Method = "Simple")
CombinedSequence = PutTogetherIteratesWithoutJumps(A$Inputs, A$Outputs)



