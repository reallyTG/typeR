library(QPot)


### Name: TSDensity
### Title: Density plot from simulation of two-dimensional stochastic
###   differential equations
### Aliases: TSDensity
### Keywords: plot simulations stochastic

### ** Examples

## Not run: 
##D # First, the parameter values, as found in TSTraj
##D model.state <- c(x = 3, y = 3)
##D model.sigma <- 0.2
##D model.deltat <- 0.005
##D model.time <- 100
##D 
##D # Second, write out the deterministic skeleton of the equations to be simulated, 
##D # as found in TSTraj
##D #Example 1 from article
##D equationx <- "1.54*x*(1.0-(x/10.14)) - (y*x*x)/(1.0 + x*x)"
##D equationy <- "((0.476*x*x*y)/(1 + x*x)) - 0.112590*y*y"
##D 
##D # Third, run it, as found in TSTraj
##D ModelOut <- TSTraj(y0 = model.state, time = model.time, deltat = model.deltat, 
##D 	x.rhs = equationx, y.rhs = equationy, sigma = model.sigma)
##D # Fourth, plot it:
##D # in 1D
##D TSDensity(ModelOut, dim = 1)
##D # in 2D
##D TSDensity(ModelOut, dim = 2, kde2d.n = 20, xlab = "")
## End(Not run)



