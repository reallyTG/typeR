library(logcondiscr)


### Name: logConDiscrCI
### Title: Compute pointwise confidence bands for the log-concave MLE of a
###   PMF
### Aliases: logConDiscrCI
### Keywords: distribtion htest nonparametric

### ** Examples

# -------------------------------------------------------------
# compute MLE and confidence bands for a random sample from a 
# Poisson distribution
# -------------------------------------------------------------
set.seed(2011)
x <- sort(rpois(n = 100, lambda = 2))
mle <- logConDiscrMLE(x)
psi <- mle$psi

# compute confidence bands
CIs <- logConDiscrCI(x, type = "MLE", output = TRUE, seed = 20062011)$CIs

# plot estimated PMF and log of estimate
par(mfrow = c(1, 2), las = 1)
true <- dpois(0:20, lambda = 2)
plot(mle$x, exp(psi), type = "b", col = 2, xlim = c(min(x), max(x) + 1), 
    xlab = "x", ylim = c(0, max(exp(psi), true, CIs[, 3])), ylab = "PMF", 
    main = "Estimate MLE from a Poisson", pch = 19)
legend("topright", c("truth", "MLE", "confidence bands"), col = c(4, 2, 2), 
    lty = c(1, 1, 2), pch = c(0, 19, NA), bty = "n")

# add true PMF
lines(0:20, true, type = "l", col = 4)

# add confidence bands
matlines(CIs[, 1], CIs[, 2:3], type = "l", lty = 2, col = 2)

# log-density
plot(mle$x, psi, type = "p", col = 2, xlim = c(min(x), max(x) + 1), 
    xlab = "x", ylab = "PMF", main = "Estimate MLE from a Poisson", 
    pch = 19, ylim = c(-6, log(max(exp(psi), true, CIs[, 3]))))
lines(0:20, log(true), type = "l", col = 4)

# add confidence bands
matlines(CIs[, 1], log(CIs[, 2:3]), type = "l", lty = 2, col = 2)


# -------------------------------------------------------------
# compute confidence bands when only estimate (not original data)
# are available (as a an example we simply use the estimator from
# above)
# -------------------------------------------------------------
x.est <- 0:6
est <- c(0.09, 0.30, 0.30, 0.19, 0.09, 0.02, 0.01)

# generate original data (up to given precision)
x <- rep(0:6, times = 100 * est)



