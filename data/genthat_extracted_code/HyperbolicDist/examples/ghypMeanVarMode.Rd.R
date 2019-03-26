library(HyperbolicDist)


### Name: Specific Generalized Hyperbolic Moments and Mode
### Title: Moments and Mode of the Generalized Hyperbolic Distribution
### Aliases: ghypMean ghypVar ghypSkew ghypKurt ghypMode
### Keywords: distribution

### ** Examples

Theta <- c(2,2,1,2,2)
ghypMean(Theta)
ghypVar(Theta)
ghypSkew(Theta)
ghypKurt(Theta)
ghypMode(Theta)
maxDens <- dghyp(ghypMode(Theta), Theta)
ghypRange <- ghypCalcRange(Theta, tol = 10^(-3)*maxDens)
curve(dghyp(x, Theta), ghypRange[1], ghypRange[2])
abline(v = ghypMode(Theta), col = "blue")
abline(v = ghypMean(Theta), col = "red")



