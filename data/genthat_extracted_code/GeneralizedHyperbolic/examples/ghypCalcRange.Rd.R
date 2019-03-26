library(GeneralizedHyperbolic)


### Name: ghypCalcRange
### Title: Range of a Generalized Hyperbolic Distribution
### Aliases: ghypCalcRange
### Keywords: distribution

### ** Examples

param <- c(0, 1, 5, 3, 1)
maxDens <- dghyp(ghypMode(param = param), param = param)
ghypRange <- ghypCalcRange(param = param, tol = 10^(-3) * maxDens)
ghypRange
curve(dghyp(x, param = param), ghypRange[1], ghypRange[2])
## Not run: ghypCalcRange(param = param, tol = 10^(-3), density = FALSE)



