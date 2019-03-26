library(HyperbolicDist)


### Name: GeneralizedHyperbolic
### Title: Generalized Hyperbolic Distribution
### Aliases: dghyp pghyp qghyp rghyp ddghyp ghypBreaks
### Keywords: distribution

### ** Examples

Theta <- c(1/2,3,1,1,0)
ghypRange <- ghypCalcRange(Theta, tol = 10^(-3))
par(mfrow = c(1,2))
curve(dghyp(x, Theta), from = ghypRange[1], to = ghypRange[2],
      n = 1000)
title("Density of the\n Generalized Hyperbolic Distribution")
curve(pghyp(x, Theta), from = ghypRange[1], to = ghypRange[2],
      n = 1000)
title("Distribution Function of the\n Generalized Hyperbolic Distribution")
dataVector <- rghyp(500, Theta)
curve(dghyp(x, Theta), range(dataVector)[1], range(dataVector)[2],
      n = 500)
hist(dataVector, freq = FALSE, add =TRUE)
title("Density and Histogram of the\n Generalized Hyperbolic Distribution")
logHist(dataVector, main =
   "Log-Density and Log-Histogramof the\n Generalized Hyperbolic Distribution")
curve(log(dghyp(x, Theta)), add = TRUE,
      range(dataVector)[1], range(dataVector)[2], n = 500)
par(mfrow = c(2,1))
curve(dghyp(x, Theta), from = ghypRange[1], to = ghypRange[2],
      n = 1000)
title("Density of the\n Generalized Hyperbolic Distribution")
curve(ddghyp(x, Theta), from = ghypRange[1], to = ghypRange[2],
      n = 1000)
title("Derivative of the Density of the\n Generalized Hyperbolic Distribution")
par(mfrow = c(1,1))
ghypRange <- ghypCalcRange(Theta, tol = 10^(-6))
curve(dghyp(x, Theta), from = ghypRange[1], to = ghypRange[2],
      n = 1000)
bks <- ghypBreaks(Theta)
abline(v = bks)



