library(GeneralizedHyperbolic)


### Name: SkewLaplace
### Title: Skew-Laplace Distribution
### Aliases: dskewlap pskewlap qskewlap rskewlap
### Keywords: distribution

### ** Examples

param <- c(1, 1, 2)
par(mfrow = c(1, 2))
curve(dskewlap(x, param = param), from = -5, to = 8, n = 1000)
title("Density of the\n Skew-Laplace Distribution")
curve(pskewlap(x, param = param), from = -5, to = 8, n = 1000)
title("Distribution Function of the\n Skew-Laplace Distribution")
dataVector <- rskewlap(500, param = param)
curve(dskewlap(x, param = param), range(dataVector)[1], range(dataVector)[2],
      n = 500)
hist(dataVector, freq = FALSE, add = TRUE)
title("Density and Histogram\n of the Skew-Laplace Distribution")
DistributionUtils::logHist(dataVector, main =
        "Log-Density and Log-Histogram\n of the Skew-Laplace Distribution")
curve(log(dskewlap(x, param = param)), add = TRUE,
      range(dataVector)[1], range(dataVector)[2], n = 500)



