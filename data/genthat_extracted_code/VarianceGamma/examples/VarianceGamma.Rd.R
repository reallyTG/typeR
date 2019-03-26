library(VarianceGamma)


### Name: VarianceGammaDistribution
### Title: The Variance Gamma Distribution
### Aliases: dvg pvg qvg rvg ddvg vgBreaks

### ** Examples

## Use the following rules for vgCalcRange when plotting graphs for dvg,
## ddvg and pvg.
## if nu < 2, use:
##   maxDens <- dvg(vgMode(param = c(vgC, sigma, theta, nu)),
##   param = c(vgC, sigma, theta, nu), log = FALSE)
##   vgRange <- vgCalcRange(param = c(vgC, sigma, theta, nu),
##     tol = 10^(-2)*maxDens, density = TRUE)

## if nu >= 2 and theta < 0, use:
##   vgRange <- c(vgC-2,vgC+6)
## if nu >= 2 and theta > 0, use:
##   vgRange <- c(vgC-6,vgC+2)
## if nu >= 2 and theta = 0, use:
##   vgRange <- c(vgC-4,vgC+4)

# Example 1 (nu < 2)
## For dvg and pvg
param <- c(0,0.5,0,0.5)
maxDens <- dvg(vgMode(param = param), param = param, log = FALSE)
## Or to specify parameter values individually, use:
maxDens <- dvg(vgMode(0,0.5,0,0.5), 0,0.5,0,0.5, log = FALSE)

vgRange <- vgCalcRange(param = param, tol = 10^(-2)*maxDens, density = TRUE)
par(mfrow = c(1,2))
curve(dvg(x, param = param), from = vgRange[1], to = vgRange[2], n = 1000)
title("Density of the Variance Gamma Distribution")
curve(pvg(x, param = param), from = vgRange[1], to = vgRange[2], n = 1000)
title("Distribution Function of the Variance Gamma Distribution")

## For rvg
require(DistributionUtils)
dataVector <- rvg(500, param = param)
curve(dvg(x, param = param), range(dataVector)[1], range(dataVector)[2],
      n = 500)
hist(dataVector, freq = FALSE, add = TRUE)
title("Density and Histogram of the Variance Gamma Distribution")
logHist(dataVector, main =
   "Log-Density and Log-Histogram of the Generalized Hyperbolic Distribution")
curve(log(dvg(x, param = param)), add = TRUE,
      range(dataVector)[1], range(dataVector)[2], n = 500)

## For dvg and ddvg
par(mfrow = c(2,1))
curve(dvg(x, param = param), from = vgRange[1], to = vgRange[2],
      n = 1000)
title("Density of the Variance Gamma Distribution")
curve(ddvg(x, param = param), from = vgRange[1], to = vgRange[2],
      n = 1000)
title("Derivative of the Density of the Variance Gamma Distribution")

# Example 2 (nu > 2 and theta = 0)
## For dvg and pvg
param <- c(0,0.5,0,3)
vgRange <- c(0-4,0+4)
par(mfrow = c(1,2))
curve(dvg(x, param = param), from = vgRange[1], to = vgRange[2],
      n = 1000)
title("Density of the Variance Gamma Distribution")
curve(pvg(x, param = param), from = vgRange[1], to = vgRange[2],
      n = 1000)
title("Distribution Function of the Variance Gamma Distribution")

## For rvg
X2 <- rvg(500, param = param)
curve(dvg(x, param = param), min(X2), max(X2), n = 500)
hist(X2, freq = FALSE, add =TRUE)
title("Density and Histogram of the Variance Gamma Distribution")
DistributionUtils::logHist(X2, main =
   "Log-Density and Log-Histogramof the Generalized Hyperbolic Distribution")
curve(log(dvg(x, param = param)), add = TRUE, min(X2), max(X2), n = 500)

## For dvg and ddvg
par(mfrow = c(2,1))
curve(dvg(x, param = param), from = vgRange[1], to = vgRange[2],
      n = 1000)
title("Density of the Variance Gamma Distribution")
curve(ddvg(x, param = param), from = vgRange[1], to = vgRange[2],
      n = 1000)
title("Derivative of the Density of the Variance Gamma Distribution")



## Use the following rules for vgCalcRange when plotting graphs for vgBreaks.
## if (nu < 2), use:
##   maxDens <- dvg(vgMode(param =c(vgC, sigma, theta, nu)),
##     param = c(vgC, sigma, theta, nu), log = FALSE)
##   vgRange <- vgCalcRange(param = param, tol = 10^(-6)*maxDens, density = TRUE)
## if (nu >= 2) and theta < 0, use:
##    vgRange <- c(vgC-2,vgC+6)
## if (nu >= 2) and theta > 0, use:
##    vgRange <- c(vgC-6,vgC+2)
## if (nu >= 2) and theta = 0, use:
##    vgRange <- c(vgC-4,vgC+4)

## Example 3 (nu < 2)
## For vgBreaks
param <- c(0,0.5,0,0.5)
maxDens <- dvg(vgMode(param = param), param = param, log = FALSE)
vgRange <- vgCalcRange(param = param, tol = 10^(-6)*maxDens, density = TRUE)
curve(dvg(x, param = param), from = vgRange[1], to = vgRange[2],
      n = 1000)
bks <- vgBreaks(param = param)
abline(v = bks)
title("Density of the Variance Gamma Distribution with breaks")

## Example 4 (nu > 2 and theta = 0)
## For vgBreaks
param <- c(0,0.5,0,3)
vgRange <- c(0-4,0+4)
curve(dvg(x, param = param), from = vgRange[1], to = vgRange[2],
      n = 1000)
bks <- vgBreaks(param = param)
abline(v = bks)
title("Density of the Variance Gamma Distribution with breaks")



