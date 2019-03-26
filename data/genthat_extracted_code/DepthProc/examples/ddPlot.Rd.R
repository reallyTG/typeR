library(DepthProc)


### Name: ddPlot
### Title: Depth versus depth plot
### Aliases: ddPlot

### ** Examples

library(sn)
library(mvtnorm)

# EXAMPLE 1: Location difference
standard <- mvrnorm(1000, c(0, 0), diag(2))
shift <- mvrnorm(1000, c(0.5, 0), diag(2))
ddPlot(x = standard, y = shift, title = "Difference in position")
ddPlot(x = standard, y = shift, location = TRUE, title = "Location aligned")

# EXAMPLE 2: Scale difference
standard <- mvrnorm(1000, c(0, 0), diag(2))
scale <- mvrnorm(1000, c(0, 0), 4 * diag(2))
ddPlot(x = standard, y = scale)
ddPlot(x = standard, y = scale, scale = TRUE)




