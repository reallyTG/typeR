library(HyperbolicDist)


### Name: ghypCalcRange
### Title: Range of a Generalized Hyperbolic Distribution
### Aliases: ghypCalcRange
### Keywords: distribution

### ** Examples

Theta <- c(1,5,3,1,0)
maxDens <- dghyp(ghypMode(Theta), Theta)
ghypRange <- ghypCalcRange(Theta, tol = 10^(-3)*maxDens)
ghypRange
curve(dghyp(x, Theta), ghypRange[1], ghypRange[2])
## Not run: ghypCalcRange(Theta, tol = 10^(-3), density = FALSE)



