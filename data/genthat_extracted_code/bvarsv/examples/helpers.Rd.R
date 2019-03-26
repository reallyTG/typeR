library(bvarsv)


### Name: helpers
### Title: Helper Functions to Access BVAR Forecast Distributions and
###   Parameter Draws
### Aliases: predictive.density predictive.draws parameter.draws
### Keywords: helpers

### ** Examples

## Not run: 
##D 
##D # Load US macro data
##D data(usmacro)
##D 
##D # Estimate trivariate BVAR using default settings
##D set.seed(5813)
##D bv <- bvar.sv.tvp(usmacro)
##D 
##D # Construct predictive density function for the second variable (inflation), one period ahead
##D f <- predictive.density(bv, v = 2, h = 1)
##D 
##D # Plot the density for a grid of values
##D grid <- seq(-2, 5, by = 0.05)
##D plot(x = grid, y = f(grid), type = "l")
##D 
##D # Cross-check: Extract MCMC sample for the same variable and horizon
##D smp <- predictive.draws(bv, v = 2, h = 1)
##D 
##D # Add density estimate to plot
##D lines(density(smp), col = "green")
##D 
## End(Not run)



