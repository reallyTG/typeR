library(GeneralizedHyperbolic)


### Name: NIG
### Title: Normal Inverse Gaussian Distribution
### Aliases: dnig pnig qnig rnig ddnig
### Keywords: distribution

### ** Examples

param <- c(0, 2, 1, 0)
nigRange <- nigCalcRange(param = param, tol = 10^(-3))
par(mfrow = c(1, 2))
curve(dnig(x, param = param), from = nigRange[1], to = nigRange[2],
      n = 1000)
title("Density of the\n Normal Inverse Gaussian Distribution")
curve(pnig(x, param = param), from = nigRange[1], to = nigRange[2],
      n = 1000)
title("Distribution Function of the\n Normal Inverse Gaussian Distribution")
dataVector <- rnig(500, param = param)
curve(dnig(x, param = param), range(dataVector)[1], range(dataVector)[2],
      n = 500)
hist(dataVector, freq = FALSE, add =TRUE)
title("Density and Histogram\n of the Normal Inverse Gaussian Distribution")
DistributionUtils::logHist(dataVector, main =
        "Log-Density and Log-Histogram\n of the Normal Inverse Gaussian Distribution")
curve(log(dnig(x, param = param)), add = TRUE,
      range(dataVector)[1], range(dataVector)[2], n = 500)
par(mfrow = c(2, 1))
curve(dnig(x, param = param), from = nigRange[1], to = nigRange[2],
      n = 1000)
title("Density of the\n Normal Inverse Gaussian Distribution")
curve(ddnig(x, param = param), from = nigRange[1], to = nigRange[2],
      n = 1000)
title("Derivative of the Density\n of the Normal Inverse Gaussian Distribution")



