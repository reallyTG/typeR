library(FixedPoint)


### Name: ConvergenceFig
### Title: A function for plotting the convergence change over a series of
###   iterates.
### Aliases: ConvergenceFig

### ** Examples

Inputs = seq(1,10)
Function = function(x){ cos(x) }
A = FixedPoint(Function, Inputs, Method = "Anderson")
ConvergenceFig(A$Inputs, A$Outputs)
# And now to only show a median norm:
Differences = A$Inputs - A$Outputs
Convergence = apply(Differences,2,function(x){median(abs(x))})
ConvergenceFig(A$Inputs, A$Outputs, Convergence, LinesToDraw = "Input_Convergence")



