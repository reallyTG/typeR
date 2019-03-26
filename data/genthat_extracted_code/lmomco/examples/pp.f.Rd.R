library(lmomco)


### Name: pp.f
### Title: Quantile Function of the Ranks of Plotting Positions
### Aliases: pp.f
### Keywords: plotting position rankit

### ** Examples

X <- sort(rexp(10))
PPlo <- pp.f(0.25, X)
PPhi <- pp.f(0.75, X)
plot(c(PPlo,NA,PPhi), c(X,NA,X))
points(pp(X), X) # Weibull i/(n+1)



