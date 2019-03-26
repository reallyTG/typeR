library(SkewHyperbolic)


### Name: SkewHyperbolicDistribution
### Title: Skewed Hyperbolic Student t-Distribution
### Aliases: dskewhyp pskewhyp qskewhyp rskewhyp ddskewhyp
### Keywords: distribution

### ** Examples

param <- c(0,1,40,10)
par(mfrow = c(1,2))
range <- skewhypCalcRange(param = param, tol = 10^(-2))

### curves of density and distribution
curve(dskewhyp(x, param = param), range[1], range[2], n = 1000)
title("Density of the \n Skew Hyperbolic Distribution")
curve(pskewhyp(x, param = param),
      range[1], range[2], n = 500)
title("Distribution Function of the \n Skew Hyperbolic Distribution")

### curves of density and log density
par(mfrow = c(1,2))
data <- rskewhyp(1000, param = param)
curve(dskewhyp(x, param = param), range(data)[1], range(data)[2],
      n = 1000, col = 2)
hist(data, freq = FALSE, add = TRUE)
title("Density and Histogram of the\n Skew Hyperbolic Distribution")
DistributionUtils::logHist(data, main =
  "Log-Density and Log-Histogram of\n the Skew Hyperbolic Distribution")
curve(dskewhyp(x, param = param, log = TRUE),
      range(data)[1], range(data)[2],
      n = 500, add = TRUE, col = 2)

##plots of density and derivative
par(mfrow = c(2,1))
curve(dskewhyp(x, param = param), range[1], range[2], n = 1000)
title("Density of the Skew\n Hyperbolic Distribution")
curve(ddskewhyp(x, param = param), range[1], range[2], n = 1000)
title("Derivative of the Density\n of the Skew Hyperbolic Distribution")

##  example of density and random numbers for beta large and nu small
par(mfrow = c(1,2))
param1 <- c(0,1,10,1)
data1 <- rskewhyp(1000, param = param1)
curve(dskewhyp(x, param = param1), range(data1)[1], range(data1)[2],
      n = 1000, col = 2, main = "Density and Histogram -- when nu is small")
hist(data1, freq = FALSE, add = TRUE)

DistributionUtils::logHist(data1, main =
      "Log-Density and Log-Histogram -- when nu is small")
curve(dskewhyp(x, param = param1, log = TRUE),
      from = min(data1), to = max(data1), n = 500, add = TRUE, col = 2)



