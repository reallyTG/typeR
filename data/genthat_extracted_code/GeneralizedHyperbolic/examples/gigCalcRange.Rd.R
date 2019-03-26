library(GeneralizedHyperbolic)


### Name: gigCalcRange
### Title: Range of a Generalized Inverse Gaussian Distribution
### Aliases: gigCalcRange
### Keywords: distribution

### ** Examples

param <- c(2.5, 0.5, 5)
maxDens <- dgig(gigMode(param = param), param = param)
gigRange <- gigCalcRange(param = param, tol = 10^(-3) * maxDens)
gigRange
curve(dgig(x, param = param), gigRange[1], gigRange[2])
## Not run: gigCalcRange(param = param, tol = 10^(-3), density = FALSE)



