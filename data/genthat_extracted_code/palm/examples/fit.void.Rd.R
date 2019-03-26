library(palm)


### Name: fit.void
### Title: Fitting a model to a void point process
### Aliases: fit.void

### ** Examples

## Not run: 
##D set.seed(1234)
##D ## Simulating a two-dimensional void process.
##D void.data <- sim.void(c(Dc = 1000, Dp = 10, tau = 0.05), rbind(c(0, 1), c(0, 1)))
##D ## Fitting model.
##D fit <- fit.void(void.data$points, rbind(c(0, 1), c(0, 1)), R = 0.5)
## End(Not run)




