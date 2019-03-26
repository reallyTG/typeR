library(FixedPoint)


### Name: ChangePerIterate
### Title: ChangePerIterate A function for plotting the change in each
###   vector per iterate.
### Aliases: ChangePerIterate

### ** Examples

Inputs = seq(1,10)
Function = function(x){ cos(x) }
A = FixedPoint(Function, Inputs, Method = "Anderson")
ChangePerIterate(A$Inputs, A$Outputs, A$Convergence)
#Any now to have it play one frame every half a second starting from the nineth iterate
ChangePerIterate(A$Inputs, A$Outputs, A$Convergence, secondhold = 0.5, FromIterate = 9)



