library(stepR)


### Name: parametricFamily
### Title: Parametric families
### Aliases: parametricFamily parametricfamily
### Keywords: distribution

### ** Examples

# parametric family "gauss": independent gaussian errors with constant variance
set.seed(1)
x <- seq(1 / 100, 1, 1 / 100)
y <- c(rnorm(50), rnorm(50, 2))
plot(x, y, pch = 16, col = "grey30", ylim = c(-3, 5))

# computation of SMUCE and its confidence statements
fit <- stepFit(y, x = x, alpha = 0.5, family = "gauss",
               jumpint = TRUE, confband = TRUE)
lines(fit, lwd = 3, col = "red", lty = "22")

# confidence intervals for the change-point locations
points(jumpint(fit), col = "red")
# confidence band
lines(confband(fit), lty = "22", col = "darkred", lwd = 2)

# "gauss" is default for family
identical(stepFit(y, x = x, alpha = 0.5, jumpint = TRUE, confband = TRUE), fit)
# missing sd is estimated by sdrobnorm
identical(stepFit(y, x = x, alpha = 0.5, family = "gauss", sd = sdrobnorm(y),
                  jumpint = TRUE, confband = TRUE), fit)

# parametric family "hsmuce": independent gaussian errors with also
# piecewise constant variance
# estimaton that is robust against variance changes
set.seed(1)
y <- c(rnorm(50, 0, 1), rnorm(50, 1, 0.2))
plot(x, y, pch = 16, col = "grey30", ylim = c(-2.5, 2))

# computation of HSMUCE and its confidence statements
fit <- stepFit(y, x = x, alpha = 0.5, family = "hsmuce",
               jumpint = TRUE, confband = TRUE)
lines(fit, lwd = 3, col = "red", lty = "22")

# confidence intervals for the change-point locations
points(jumpint(fit), col = "red")
# confidence band
lines(confband(fit), lty = "22", col = "darkred", lwd = 2)

# for comparison SMUCE
lines(stepFit(y, x = x, alpha = 0.5, jumpint = TRUE, confband = TRUE),
      lwd = 3, col = "blue", lty = "22")


# parametric family "mDependentPS": m dependent observations with known covariances
# observations are generated from a moving average process
set.seed(1)
y <- c(rep(0, 50), rep(2, 50)) +
  as.numeric(arima.sim(n = 100, list(ar = c(), ma = c(0.8, 0.5, 0.3)), sd = 0.5))
correlations <- as.numeric(ARMAacf(ar = c(), ma = c(0.8, 0.5, 0.3), lag.max = 3))
covariances <- 0.5^2 * correlations
plot(x, y, pch = 16, col = "grey30", ylim = c(-2, 4))

# computation of SMUCE for dependent observations with given covariances
fit <- stepFit(y, x = x, alpha = 0.5, family = "mDependentPS",
               covariances = covariances, jumpint = TRUE, confband = TRUE)
lines(fit, lwd = 3, col = "red", lty = "22")

# confidence intervals for the change-point locations
points(jumpint(fit), col = "red")
# confidence band
lines(confband(fit), lty = "22", col = "darkred", lwd = 2)

# for comparison SMUCE for independent gaussian errors
lines(stepFit(y, x = x, alpha = 0.5, jumpint = TRUE, confband = TRUE),
      lwd = 3, col = "blue", lty = "22")

# covariance structure can also be given by correlations and sd
identical(stepFit(y, x = x, alpha = 0.5, family = "mDependentPS",
                  correlations = correlations, sd = 0.5,
                  jumpint = TRUE, confband = TRUE), fit)

# if sd is missing it will be estimated by sdrobnorm
identical(stepFit(y, x = x, alpha = 0.5,family = "mDependentPS",
                  correlations = correlations, jumpint = TRUE, confband = TRUE),
          stepFit(y, x = x, alpha = 0.5, family = "mDependentPS",
                  correlations = correlations,
                  sd = sdrobnorm(y, lag = length(correlations)),
                  jumpint = TRUE, confband = TRUE))



