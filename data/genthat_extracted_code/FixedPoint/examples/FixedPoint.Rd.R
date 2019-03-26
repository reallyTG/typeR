library(FixedPoint)


### Name: FixedPoint
### Title: A function for finding the fixed point of a contraction mapping
### Aliases: FixedPoint

### ** Examples

# For the simplest possible example we can seek the fixed point of the cos function with a scalar.
Inputs = 0.3
Function = function(x){ cos(x) }
A = FixedPoint(Function, Inputs, Method = "Aitken", Dampening = 0.5)
B = FixedPoint(Function, Inputs, Method = "Anderson", Dampening = 1.0)

# For this next one the ConvergenceMetricThreshold is negative so the algorithm
# will keep running until MaxIter is met.
C = FixedPoint(Function, Inputs, Method = "Simple", MaxIter = 4, ConvergenceMetricThreshold = -1)
# This is not yet close to the fixed point but we can continue solving for this fixed point
# by inputting the previous inputs and outputs to the function. We can also switch methods
# and will switch below to the Newton Method.
D = FixedPoint(Function, C$Inputs, C$Outputs, Method = "Newton")

# We can also find a 4 dimensional fixed point vector of this function.
Inputs = c(0.3, 98, 0, pi)
E = FixedPoint(Function, Inputs, Method = "Anderson")
F = FixedPoint(Function, Inputs, Method = "Anderson", MaxM = 4, ReportingSigFig = 13)



