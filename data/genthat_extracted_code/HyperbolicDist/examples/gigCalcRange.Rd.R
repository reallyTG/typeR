library(HyperbolicDist)


### Name: gigCalcRange
### Title: Range of a Generalized Inverse Gaussian Distribution
### Aliases: gigCalcRange
### Keywords: distribution

### ** Examples

Theta <- c(-0.5,5,2.5)
maxDens <- dgig(gigMode(Theta), Theta)
gigRange <- gigCalcRange(Theta, tol = 10^(-3)*maxDens)
gigRange
curve(dgig(x, Theta), gigRange[1], gigRange[2])
## Not run: gigCalcRange(Theta, tol = 10^(-3), density = FALSE)



