library(SkewHyperbolic)


### Name: skewhypCalcRange
### Title: Range of a Skew Hyperbolic Student t-Distribution
### Aliases: skewhypCalcRange skewhypStepSize
### Keywords: distribution

### ** Examples

param <- c(0,1,10,10)
range <- skewhypCalcRange(param = param, tol = 10^(-2))
range
curve(dskewhyp(x, param = c(0,1,5,10), range[1], range[2]))

param <- c(0,1,20,1)
(range <- skewhypCalcRange(param = param))
round(integrate(dskewhyp, -Inf, range[1], param = param)$value,7)
round(integrate(dskewhyp, range[2], Inf, param = param)$value,7)



