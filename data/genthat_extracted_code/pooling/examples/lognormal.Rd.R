library(pooling)


### Name: lognormal
### Title: Fit Lognormal Regression for Y vs. Covariates
### Aliases: lognormal

### ** Examples

# Generate data
set.seed(123)
x <- rnorm(1000)
y <- rlnorm(1000, meanlog = 0.5 + 0.25 * x, sdlog = 0.5)

# Fit model
fit <- lognormal(y = y, x = x)
fit$theta.hat
fit$varcov
fit$aic

# Plot E(Y) vs. X according to model fit
plot(x, y, main = "Lognormal Model for Y vs. X")
xvals <- seq(min(x), max(x), 0.01)
yvals <- exp(fit$theta.hat[1] + fit$theta.hat[2] * xvals + fit$theta.hat[3] / 2)
points(xvals, yvals, type = "l")





