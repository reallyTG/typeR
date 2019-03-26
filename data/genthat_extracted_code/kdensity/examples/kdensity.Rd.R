library(kdensity)


### Name: kdensity
### Title: Parametrically guided kernel density estimation
### Aliases: kdensity

### ** Examples

## Use gamma kernels to model positive data, the concentration of
## theophylline

concentration = Theoph$conc + 0.001
plot(kdensity(concentration, start = "gamma", kernel = "gamma", adjust = 1/3),
     ylim = c(0, 0.15), lwd = 2, main = "Concentration of theophylline")
lines(kdensity(concentration, start = "gamma", kernel = "gaussian"),
      lty = 2, col = "grey", lwd = 2)
lines(kdensity(concentration, start = "gaussian", kernel = "gaussian"),
      lty = 3, col = "blue", lwd = 2)
lines(kdensity(concentration, start = "gaussian", kernel = "gamma", adjust = 1/3),
      lty = 4, col = "red", lwd = 2)
rug(concentration)

## Using a density and and estimator from another package.

skew_hyperbolic = list(
  density   = SkewHyperbolic::dskewhyp,
  estimator = function(x) SkewHyperbolic::skewhypFit(x, printOut = FALSE)$param,
  support   = c(-Inf, Inf)
)

kde = kdensity(diff(LakeHuron), start = skew_hyperbolic)
plot(kde, lwd = 2, col = "blue",
     main = "Annual differences in water level (ft) of Lake Huron, 1875 - 1972")
lines(kde, plot_start = TRUE, lty = 2, lwd = 2) # Plots the skew hyperbolic density.
rug(diff(LakeHuron))

kde$estimates # Also: coef(kde)
# Displays the parameter estimates:
#        mu     delta      beta        nu
# -1.140713  3.301112  2.551657 26.462469




