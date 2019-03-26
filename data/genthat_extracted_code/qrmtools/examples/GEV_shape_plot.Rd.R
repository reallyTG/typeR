library(qrmtools)


### Name: GEV_shape_plot
### Title: Fitted GEV Shape as a Function of the Threshold
### Aliases: GEV_shape_plot
### Keywords: parametric hplot

### ** Examples

set.seed(271)
X <- rPar(5e4, shape = 4)
GEV_shape_plot(X)
abline(h = 1/4, lty = 3) # theoretical xi = 1/shape for Pareto



