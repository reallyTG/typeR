library(GeneralizedHyperbolic)


### Name: Hyperbolic
### Title: Hyperbolic Distribution
### Aliases: dhyperb phyperb qhyperb rhyperb ddhyperb
### Keywords: distribution

### ** Examples

param <- c(0, 2, 1, 0)
hyperbRange <- hyperbCalcRange(param = param, tol = 10^(-3))
par(mfrow = c(1, 2))
curve(dhyperb(x, param = param), from = hyperbRange[1], to = hyperbRange[2],
      n = 1000)
title("Density of the\n Hyperbolic Distribution")
curve(phyperb(x, param = param), from = hyperbRange[1], to = hyperbRange[2],
      n = 1000)
title("Distribution Function of the\n Hyperbolic Distribution")
dataVector <- rhyperb(500, param = param)
curve(dhyperb(x, param = param), range(dataVector)[1], range(dataVector)[2],
      n = 500)
hist(dataVector, freq = FALSE, add =TRUE)
title("Density and Histogram\n of the Hyperbolic Distribution")
DistributionUtils::logHist(dataVector, main =
        "Log-Density and Log-Histogram\n of the Hyperbolic Distribution")
curve(log(dhyperb(x, param = param)), add = TRUE,
      range(dataVector)[1], range(dataVector)[2], n = 500)
par(mfrow = c(2, 1))
curve(dhyperb(x, param = param), from = hyperbRange[1], to = hyperbRange[2],
      n = 1000)
title("Density of the\n Hyperbolic Distribution")
curve(ddhyperb(x, param = param), from = hyperbRange[1], to = hyperbRange[2],
      n = 1000)
title("Derivative of the Density\n of the Hyperbolic Distribution")



