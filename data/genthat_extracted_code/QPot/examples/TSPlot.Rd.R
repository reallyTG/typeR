library(QPot)


### Name: TSPlot
### Title: Plot simulation of two-dimensional stochastic differential
###   equations
### Aliases: TSPlot
### Keywords: plot simulations stochastic

### ** Examples

# First, the parameter values, as found in TSTraj
model.state <- c(x = 3, y = 3)
model.sigma <- 0.2
model.deltat <- 0.05
model.time <- 100

# Second, write out the deterministic skeleton of the equations to be simulated, 
# as found in TSTraj
#Example 1 from article
equationx <- "1.54*x*(1.0-(x/10.14)) - (y*x*x)/(1.0 + x*x)"
equationy <- "((0.476*x*x*y)/(1 + x*x)) - 0.112590*y*y"

# Third, run it, as found in TSTraj
ModelOut <- TSTraj(y0 = model.state, time = model.time, deltat = model.deltat, 
	x.rhs = equationx, y.rhs = equationy, sigma = model.sigma)
# Fourth, plot it:
# in 1D
TSPlot(ModelOut, deltat = model.deltat, dim = 1)
# in 2D
TSPlot(ModelOut, deltat = model.deltat, dim = 2)



