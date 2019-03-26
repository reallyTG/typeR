library(HyperbolicDist)


### Name: Generalized Inverse Gaussian
### Title: Generalized Inverse Gaussian Distribution
### Aliases: dgig pgig qgig rgig rgig1 ddgig gigBreaks
### Keywords: distribution

### ** Examples

Theta <- c(1,2,3)
gigRange <- gigCalcRange(Theta, tol = 10^(-3))
par(mfrow = c(1,2))
curve(dgig(x, Theta), from = gigRange[1], to = gigRange[2],
      n = 1000)
title("Density of the\n Generalized Inverse Gaussian")
curve(pgig(x, Theta), from = gigRange[1], to = gigRange[2],
      n = 1000)
title("Distribution Function of the\n Generalized Inverse Gaussian")
dataVector <- rgig(500, Theta)
curve(dgig(x, Theta), range(dataVector)[1], range(dataVector)[2],
      n = 500)
hist(dataVector, freq = FALSE, add =TRUE)
title("Density and Histogram\n of the Generalized Inverse Gaussian")
logHist(dataVector, main =
   "Log-Density and Log-Histogram\n of the Generalized Inverse Gaussian")
curve(log(dgig(x, Theta)), add = TRUE,
      range(dataVector)[1], range(dataVector)[2], n = 500)
par(mfrow = c(2,1))
curve(dgig(x, Theta), from = gigRange[1], to = gigRange[2],
      n = 1000)
title("Density of the\n Generalized Inverse Gaussian")
curve(ddgig(x, Theta), from = gigRange[1], to = gigRange[2],
      n = 1000)
title("Derivative of the Density\n of the Generalized Inverse Gaussian")
par(mfrow = c(1,1))
gigRange <- gigCalcRange(Theta, tol = 10^(-6))
curve(dgig(x, Theta), from = gigRange[1], to = gigRange[2],
      n = 1000)
bks <- gigBreaks(Theta)
abline(v = bks)



