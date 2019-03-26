library(BaPreStoPro)


### Name: estimate,jumpDiffusion-method
### Title: Estimation for jump diffusion process
### Aliases: estimate,jumpDiffusion-method

### ** Examples

# non-informative
model <- set.to.class("jumpDiffusion", Lambda = function(t, xi) (t/xi[2])^xi[1],
               parameter = list(theta = 0.1, phi = 0.05, gamma2 = 0.1, xi = c(3, 1/4)))
t <- seq(0, 1, by = 0.01)
data <- simulate(model, t = t, y0 = 0.5, plot.series = TRUE)
est <- estimate(model, t, data, 1000)
plot(est)

# informative
model <- set.to.class("jumpDiffusion", Lambda = function(t, xi) (t/xi[2])^xi[1],
   parameter = list(theta = 0.1, phi = 0.05, gamma2 = 0.1, xi = c(3, 1/4)),
   priorDensity = list(phi = function(phi) dnorm(phi, 0.05, 0.01),
                       theta = function(theta) dgamma(1/theta, 10, 0.1*9),
                       gamma2 = function(gamma2) dgamma(1/gamma2, 10, 0.1*9),
                       xi = function(xi) dnorm(xi, c(3, 1/4), c(1,1))))
t <- seq(0, 1, by = 0.01)
data <- simulate(model, t = t, y0 = 0.5, plot.series = TRUE)
est <- estimate(model, t, data, 1000)
plot(est)

## Not run: 
##D est_hidden <- estimate(model, t, data$Y, 1000)
##D plot(est_hidden)
## End(Not run)



