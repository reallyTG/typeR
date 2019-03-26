library(HyperbolicDist)


### Name: hyperbCalcRange
### Title: Range of a Hyperbolic Distribution
### Aliases: hyperbCalcRange
### Keywords: distribution

### ** Examples

par(mfrow = c(1,2))
Theta <- c(3,5,1,0)
hyperbRange <- hyperbCalcRange(Theta, tol = 10^(-3))
hyperbRange
curve(phyperb(x, Theta), hyperbRange[1], hyperbRange[2])
maxDens <- dhyperb(hyperbMode(Theta), Theta)
hyperbRange <- hyperbCalcRange(Theta, tol = 10^(-3)*maxDens, density = TRUE)
hyperbRange
curve(dhyperb(x, Theta), hyperbRange[1], hyperbRange[2])



