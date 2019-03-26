library(stepR)


### Name: computeStat
### Title: Computation of the multiscale statistic
### Aliases: computeStat
### Keywords: nonparametric

### ** Examples

y <- rnorm(100)
# for the default signal = 0 a signal constant 0 is assumed
identical(computeStat(y), computeStat(y,
            signal = list(leftIndex = 1L, rightIndex = 100L, value = 0)))

# different constant value
ret <- computeStat(y, signal = 1)
# penalised multiscale statistic
identical(ret$maximum, computeStat(y, signal = 1, output = "maximum"))
# multiscale vector of penalised statistics
identical(ret$stat, computeStat(y, signal = 1, output = "vector"))

y <- c(rnorm(50), rnorm(50, 1))
# true signal
computeStat(y, signal = list(leftIndex = c(1L, 51L), rightIndex = c(50L, 100L),
                             value = c(0, 1)))

# fit satisfies the multiscale contraint, i.e.
# the penalised multiscale statistic is not larger than the used global quantile 1
computeStat(y, signal = stepFit(y, q = 1), output = "maximum") <= 1

# different interval system, lengths, penalty, given parameter sd
# and computed for an increased number of observations nq
computeStat(y, signal = list(leftIndex = c(1L, 51L), rightIndex = c(50L, 100L),
                             value = c(0, 1)), nq = 128, sd = 0.5,
            intervalSystem = "dyaLen", lengths = c(1L, 2L, 4L, 8L), penalty = "none")

# family "hsmuce"
computeStat(y, signal = mean(y), family = "hsmuce")

# family "mDependentPS"
signal <- list(leftIndex = c(1L, 13L), rightIndex = c(12L, 17L), value = c(0, -1))
y <- c(rep(0, 13), rep(-1, 4)) + 
  as.numeric(arima.sim(n = 17, list(ar = c(), ma = c(0.8, 0.5, 0.3)), sd = 1))
covariances <- as.numeric(ARMAacf(ar = c(), ma = c(0.8, 0.5, 0.3), lag.max = 3))
computeStat(y, signal = signal, family = "mDependentPS", covariances = covariances)



