library(pooling)


### Name: gamma_constantscale
### Title: Fit Constant-Scale Gamma Model for Y vs. Covariates
### Aliases: gamma_constantscale

### ** Examples

# Generate data
set.seed(123)
x <- rnorm(1000)
y <- rgamma(1000, shape = exp(0.5 + 0.25 * x), scale = 0.25)

# Fit model
fit <- gamma_constantscale(y = y, x = x)
fit$theta.hat
fit$varcov
fit$aic

# Plot E(Y) vs. X according to model fit
plot(x, y, main = "Gamma Model for Y vs. X")
xvals <- seq(min(x), max(x), 0.01)
yvals <- exp(fit$theta.hat[1] + fit$theta.hat[2] * xvals) * fit$theta.hat[3]
points(xvals, yvals, type = "l")





