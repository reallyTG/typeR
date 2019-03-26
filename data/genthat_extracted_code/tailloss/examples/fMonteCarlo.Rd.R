library(tailloss)


### Name: fMonteCarlo
### Title: Monte Carlo Simulations.
### Aliases: fMonteCarlo
### Keywords: montecarlo

### ** Examples

data(UShurricane)

# Compress the table to millions of dollars

USh.m <- compressELT(ELT(UShurricane), digits = -6)
EPC.MonteCarlo <- fMonteCarlo(USh.m, s = 1:40, verbose = TRUE)
EPC.MonteCarlo
par(mfrow = c(1, 2))
plot(EPC.MonteCarlo[, 1:2], type = "l", ylim = c(0, 1))
matlines(EPC.MonteCarlo[, -2], ylim = c(0, 1), lty = 2, col = 1)
# Assuming the losses follow a Gamma with E[X] = x, and Var[X] = 2 * x and cap = 5m
EPC.MonteCarlo.Gamma <- fMonteCarlo(USh.m, s = 1:40, theta = 2, cap = 5, verbose = TRUE)
EPC.MonteCarlo.Gamma
plot(EPC.MonteCarlo.Gamma[, 1:2], type = "l", ylim = c(0, 1))
matlines(EPC.MonteCarlo.Gamma[, -2], ylim = c(0,1), lty = 2, col = 1)
# Compare the two results:
par(mfrow = c(1, 1))
plot(EPC.MonteCarlo[, 1:2], type = "l", main = "Exceedance Probability Curve",
ylim = c(0, 1))
lines(EPC.MonteCarlo.Gamma[, 1:2], col = 2, lty = 2)
legend("topright", c("Dirac Delta", expression(paste("Gamma(",
alpha[i] == 1 / theta^2, ", ", beta[i] ==1 / (x[i] * theta^2), ")", " cap =", 5))),
lwd = 2, lty = 1:2, col = 1:2)



