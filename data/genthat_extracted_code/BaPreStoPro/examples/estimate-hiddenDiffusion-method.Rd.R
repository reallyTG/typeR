library(BaPreStoPro)


### Name: estimate,hiddenDiffusion-method
### Title: Estimation for hidden diffusion process
### Aliases: estimate,hiddenDiffusion-method

### ** Examples

model <- set.to.class("hiddenDiffusion", y0.fun = function(phi, t) 0.5,
             parameter = list(phi = 5, gamma2 = 1, sigma2 = 0.1))
t <- seq(0, 1, by = 0.01)
data <- simulate(model, t = t, plot.series = TRUE)
est <- estimate(model, t, data$Z, 100)  # nMCMC should be much larger!
plot(est)

## Not run: 
##D # OU
##D b.fun <- function(phi, t, y) phi[1]-phi[2]*y
##D model <- set.to.class("hiddenDiffusion", y0.fun = function(phi, t) 0.5,
##D                parameter = list(phi = c(10, 1), gamma2 = 1, sigma2 = 0.1),
##D                b.fun = b.fun, sT.fun = function(t, x) 1)
##D t <- seq(0, 1, by = 0.01)
##D data <- simulate(model, t = t, plot.series = TRUE)
##D est <- estimate(model, t, data$Z, 1000)
##D plot(est)
## End(Not run)



