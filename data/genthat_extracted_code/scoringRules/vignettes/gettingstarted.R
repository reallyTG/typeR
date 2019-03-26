## ----echo = FALSE, fig.align='center', fig.width = 5---------------------

grid <- seq(from = -5, to = 10, length.out = 1000)
plot(x = grid, y = dnorm(grid, mean = 2, sd = 2), bty = "n", type = "l", xlab = "Value", ylab = "Density")
abline(v = 0, lwd = 2, lty = 2)

## ------------------------------------------------------------------------
library(scoringRules)
# CRPS of a normal distribution with mean = standard deviation = 2, outcome is zero
crps(y = 0, family = "normal", mean = 2, sd = 2)

## ----echo = FALSE, fig.align='center', fig.width = 5---------------------
# Load data
data(gdp_mcmc)

# Histogram of forecast draws for 2012Q4
dat <- gdp_mcmc$forecasts[, "X2012Q4"]
h <- hist(dat, plot = FALSE)
h$counts <- h$density
grid <- seq(from = min(h$breaks), to = max(h$breaks), length.out = 1000)
n_approx <- dnorm(grid, mean = mean(dat), sd = sd(dat))
plot(h, xlab = "Value", ylab = "Probability", main = "")

# Add vertical line at realizing value
abline(v = gdp_mcmc$actuals[, "X2012Q4"], lwd = 2, lty = 2)

## ------------------------------------------------------------------------
# Load data
data(gdp_mcmc)
# Get forecast distribution for 2012:Q4
dat <- gdp_mcmc$forecasts[, "X2012Q4"]
# Get realization for 2012:Q4
y <- gdp_mcmc$actuals[, "X2012Q4"]
# Compute CRPS of simulated sample
crps_sample(y = y, dat = dat)


