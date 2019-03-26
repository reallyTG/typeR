library(GeneralizedHyperbolic)


### Name: Specific Generalized Hyperbolic Moments and Mode
### Title: Moments and Mode of the Generalized Hyperbolic Distribution
### Aliases: ghypMean ghypVar ghypSkew ghypKurt ghypMode
### Keywords: distribution

### ** Examples

param <- c(2, 2, 2, 1, 2)
ghypMean(param = param)
ghypVar(param = param)
ghypSkew(param = param)
ghypKurt(param = param)
ghypMode(param = param)
maxDens <- dghyp(ghypMode(param = param), param = param)
ghypRange <- ghypCalcRange(param = param, tol = 10^(-3) * maxDens)
curve(dghyp(x, param = param), ghypRange[1], ghypRange[2])
abline(v = ghypMode(param = param), col = "blue")
abline(v = ghypMean(param = param), col = "red")



