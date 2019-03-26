## ----setup, echo = FALSE, message = FALSE--------------------------------
# fig.width=5.5, 
library(knitr)
# opts_chunk$set(fig.align='center', fig.height=5, warning=FALSE,
#                dev='pdf', prompt=TRUE, comment=NA, highlight=FALSE, tidy=FALSE)
library(stepR)

## ----plotgauss, fig.lp="fig:1", fig.cap = 'Observations (grey points) and underlying function (black line).'----
set.seed(1)
n <- 100L
x <- seq(1 / n, 1, 1 / n)
mu <- stepfit(cost = 0, family = "gauss", value = c(0, 3, 0, -2, 0), param = NULL,
              leftEnd = x[c(1, 21, 26, 71, 81)],
              rightEnd = x[c(20, 25, 70, 80, 100)], x0 = 0,
              leftIndex = c(1, 21, 26, 71, 81),
              rightIndex = c(20, 25, 70, 80, 100))
sigma0 <- 0.5
epsilon <- rnorm(n, 0, sigma0)
y <- fitted(mu) + epsilon
plot(x, y, pch = 16, col = "grey30", ylim = c(-3, 4))
lines(mu, lwd = 3)

## ----stepFit, fig.lp="fig:1", fig.cap = 'Observations (grey points), underlying function (black line), fit by the multiscale estimator (red line), its confidence intervals for the change-point locations (red brackets) and its confidence band for the underlying function (darkred lines).'----
fit <- stepFit(y, x = x, alpha = 0.5, jumpint = TRUE, confband = TRUE)

plot(x, y, pch = 16, col = "grey30", ylim = c(-3, 4))
lines(mu, lwd = 3)
lines(fit, lwd = 3, col = "red", lty = "22")

# confidence intervals for the change-point locations
points(jumpint(fit), col = "red")
# confidence band
lines(confband(fit), lty = "22", col = "darkred", lwd = 2)

## ----critVal-------------------------------------------------------------
# was called in stepFit, can be called explicitly,
# for instance outside of a for loop to save computation time
qVector <- critVal(length(y), alpha = 0.5)
identical(stepFit(y, x = x, q = qVector, jumpint = TRUE, confband = TRUE), fit)

qValue <- critVal(length(y), alpha = 0.5, output = "value")
identical(stepFit(y, x = x, q = qValue, jumpint = TRUE, confband = TRUE), fit)

## ----computeStat---------------------------------------------------------
# fit satisfies the multiscale contraint, i.e.
# the computed penalized multiscale statistic is not larger than the global quantile
computeStat(y, signal = fit, output = "maximum") < qValue
# multiscale vector of statistics is componentwise not larger than 
# the vector of critical values
all(computeStat(y, signal = fit, output = "vector") < qVector)

## ----computeBounds-------------------------------------------------------
# the multiscale contraint
bounds <- computeBounds(y, alpha = 0.5)

## ----monteCarloSimulation------------------------------------------------
# monteCarloSimulation will be called in critVal, can be called explicitly
# object of class MCSimulationVector
stat <- monteCarloSimulation(n = length(y))
identical(critVal(n = length(y), alpha = 0.5, stat = stat),
          critVal(n = length(y), alpha = 0.5,
                  options = list(load = list(), simulation = "matrix")))

# object of class MCSimulationMaximum
stat <- monteCarloSimulation(n = length(y), output = "maximum")
identical(critVal(n = length(y), alpha = 0.5, stat = stat),
          critVal(n = length(y), alpha = 0.5,
                  options = list(load = list(), simulation = "vector")))

