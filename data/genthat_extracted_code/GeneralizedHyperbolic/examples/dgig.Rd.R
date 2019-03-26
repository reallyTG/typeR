library(GeneralizedHyperbolic)


### Name: Generalized Inverse Gaussian
### Title: Generalized Inverse Gaussian Distribution
### Aliases: dgig pgig qgig rgig rgig1 ddgig
### Keywords: distribution

### ** Examples

param <- c(2, 3, 1)
gigRange <- gigCalcRange(param = param, tol = 10^(-3))
par(mfrow = c(1, 2))
curve(dgig(x, param = param), from = gigRange[1], to = gigRange[2],
      n = 1000)
title("Density of the\n Generalized Inverse Gaussian")
curve(pgig(x, param = param), from = gigRange[1], to = gigRange[2],
      n = 1000)
title("Distribution Function of the\n Generalized Inverse Gaussian")
dataVector <- rgig(500, param = param)
curve(dgig(x, param = param), range(dataVector)[1], range(dataVector)[2],
      n = 500)
hist(dataVector, freq = FALSE, add = TRUE)
title("Density and Histogram\n of the Generalized Inverse Gaussian")
DistributionUtils::logHist(dataVector, main =
        "Log-Density and Log-Histogram\n of the Generalized Inverse Gaussian")
curve(log(dgig(x, param = param)), add = TRUE,
      range(dataVector)[1], range(dataVector)[2], n = 500)
par(mfrow = c(2, 1))
curve(dgig(x, param = param), from = gigRange[1], to = gigRange[2],
      n = 1000)
title("Density of the\n Generalized Inverse Gaussian")
curve(ddgig(x, param = param), from = gigRange[1], to = gigRange[2],
      n = 1000)
title("Derivative of the Density\n of the Generalized Inverse Gaussian")



