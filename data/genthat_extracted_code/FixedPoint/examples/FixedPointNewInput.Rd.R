library(FixedPoint)


### Name: FixedPointNewInput
### Title: FixedPointNewInput This function takes the previous inputs and
###   outputs from the FixedPoint function and determines what vector to
###   try next in seeking a fixed point.
### Aliases: FixedPointNewInput

### ** Examples

FPFunction = function(x){c(0.5*sqrt(abs(x[1] + x[2])), 1.5*x[1] + 0.5*x[2])}
A = FixedPoint( Function = FPFunction, Inputs = c(0.3,900), MaxIter = 6, Method = "Simple")
NewGuessAnderson = FixedPointNewInput(A$Inputs, A$Outputs, Method = "Anderson")
NewGuessVEA = FixedPointNewInput(A$Inputs, A$Outputs, Method = "VEA")
NewGuessMPE = FixedPointNewInput(A$Inputs, A$Outputs, Method = "MPE")
NewGuessAitken = FixedPointNewInput(A$Inputs, A$Outputs, Method = "Aitken")



