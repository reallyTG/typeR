library(GeneralizedHyperbolic)


### Name: hyperbCalcRange
### Title: Range of a Hyperbolic Distribution
### Aliases: hyperbCalcRange
### Keywords: distribution

### ** Examples

par(mfrow = c(1, 2))
param <- c(0, 1, 3, 1)
hyperbRange <- hyperbCalcRange(param = param, tol = 10^(-3))
hyperbRange
curve(phyperb(x, param = param), hyperbRange[1], hyperbRange[2])
maxDens <- dhyperb(hyperbMode(param = param), param = param)
hyperbRange <- hyperbCalcRange(param = param, tol = 10^(-3) * maxDens, density = TRUE)
hyperbRange
curve(dhyperb(x, param = param), hyperbRange[1], hyperbRange[2])



