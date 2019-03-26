library(palm)


### Name: fit.ns
### Title: Fitting a Neyman-Scott point process model
### Aliases: fit.ns

### ** Examples

## Fitting model to example data.
fit <- fit.ns(example.2D, lims = rbind(c(0, 1), c(0, 1)), R = 0.5)
## Printing estimates.
coef(fit)
## Plotting the estimated Palm intensity.
plot(fit)
## Not run: 
##D ## Simulating data and fitting additional models.
##D set.seed(1234)
##D ## One-dimensional Thomas process.
##D data.thomas <- sim.ns(c(D = 10, lambda = 5, sigma = 0.025), lims = rbind(c(0, 1)))
##D ## Fitting a model to these data.
##D fit.thomas <- fit.ns(data.thomas$points, lims = rbind(c(0, 1)), R = 0.5)
##D ## Three-dimensional Matern process.
##D data.matern <- sim.ns(c(D = 10, lambda = 10, tau = 0.1), disp = "uniform",
##D                       lims = rbind(c(0, 1), c(0, 2), c(0, 3)))
##D ## Fitting a model to these data.
##D fit.matern <- fit.ns(data.matern$points, lims = rbind(c(0, 1), c(0, 2), c(0, 3)),
##D                      R = 0.5, disp = "uniform")
## End(Not run)




