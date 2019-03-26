library(GeneralizedHyperbolic)


### Name: GeneralizedHyperbolicDistribution
### Title: Generalized Hyperbolic Distribution
### Aliases: dghyp pghyp qghyp rghyp ddghyp
### Keywords: distribution

### ** Examples

param <- c(0, 1, 3, 1, 1/2)
ghypRange <- ghypCalcRange(param = param, tol = 10^(-3))
par(mfrow = c(1, 2))

### curves of density and distribution
curve(dghyp(x, param = param), ghypRange[1], ghypRange[2], n = 1000)
title("Density of the \n Generalized  Hyperbolic Distribution")
curve(pghyp(x, param = param), ghypRange[1], ghypRange[2], n = 500)
title("Distribution Function of the \n Generalized Hyperbolic Distribution")

### curves of density and log density
par(mfrow = c(1, 2))
data <- rghyp(1000, param = param)
curve(dghyp(x, param = param), range(data)[1], range(data)[2],
      n = 1000, col = 2)
hist(data, freq = FALSE, add = TRUE)
title("Density and Histogram of the\n Generalized Hyperbolic Distribution")
DistributionUtils::logHist(data,
    main = "Log-Density and Log-Histogram of\n the Generalized Hyperbolic Distribution")
curve(log(dghyp(x, param = param)),
      range(data)[1], range(data)[2],
      n = 500, add = TRUE, col = 2)

### plots of density and derivative
par(mfrow = c(2, 1))
curve(dghyp(x, param = param), ghypRange[1], ghypRange[2], n = 1000)
title("Density of the\n Generalized  Hyperbolic Distribution")
curve(ddghyp(x, param = param), ghypRange[1], ghypRange[2], n = 1000)
title("Derivative of the Density of the\n Generalized Hyperbolic Distribution")



