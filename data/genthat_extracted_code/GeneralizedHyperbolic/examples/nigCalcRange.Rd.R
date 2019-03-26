library(GeneralizedHyperbolic)


### Name: nigCalcRange
### Title: Range of a normal inverse Gaussian Distribution
### Aliases: nigCalcRange
### Keywords: distribution

### ** Examples

par(mfrow = c(1, 2))
param <- c(0, 1, 3, 1)
nigRange <- nigCalcRange(param = param, tol = 10^(-3))
nigRange
curve(pnig(x, param = param), nigRange[1], nigRange[2])
maxDens <- dnig(nigMode(param = param), param = param)
nigRange <- nigCalcRange(param = param, tol = 10^(-3) * maxDens, density = TRUE)
nigRange
curve(dnig(x, param = param), nigRange[1], nigRange[2])



