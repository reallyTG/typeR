library(BaPreStoPro)


### Name: estimate,hiddenmixedDiffusion-method
### Title: Estimation for hierarchical (mixed) hidden diffusion process
### Aliases: estimate,hiddenmixedDiffusion-method

### ** Examples

mu <- c(5, 1); Omega <- c(0.9, 0.04)
phi <- cbind(rnorm(21, mu[1], sqrt(Omega[1])), rnorm(21, mu[2], sqrt(Omega[2])))
y0.fun <- function(phi, t) phi[2]
model <- set.to.class("hiddenmixedDiffusion", y0.fun = y0.fun,
                 b.fun = function(phi, t, y) phi[1],
                 parameter = list(phi = phi, mu = mu, Omega = Omega, gamma2 = 1, sigma2 = 0.01))
t <- seq(0, 1, by = 0.01)
data <- simulate(model, t = t, plot.series = TRUE)

## Not run: 
##D est <- estimate(model, t, data$Z[1:20,], 2000)
##D plot(est)
## End(Not run)



