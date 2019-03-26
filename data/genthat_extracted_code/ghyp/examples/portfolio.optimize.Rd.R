library(ghyp)


### Name: portfolio.optimize
### Title: Portfolio optimization with respect to alternative risk measures
### Aliases: portfolio.optimize
### Keywords: optimize multivariate iteration

### ** Examples


data(indices)

t.object <- fit.tmv(-indices, silent = TRUE)
gauss.object <- fit.gaussmv(-indices)

t.ptf <- portfolio.optimize(t.object,
                            risk.measure = "expected.shortfall",
                            type = "minimum.risk",
                            level = 0.99,
                            distr = "loss",
                            silent = TRUE)

gauss.ptf <- portfolio.optimize(gauss.object,
                                risk.measure = "expected.shortfall",
                                type = "minimum.risk",
                                level = 0.99,
                                distr = "loss")

par(mfrow = c(1, 3))

plot(c(t.ptf$risk, gauss.ptf$risk),
     c(-mean(t.ptf$portfolio.dist), -mean(gauss.ptf$portfolio.dist)),
     xlim = c(0, 0.035), ylim = c(0, 0.004),
     col = c("black", "red"), lwd = 4,
     xlab = "99 percent expected shortfall",
     ylab = "Expected portfolio return",
     main = "Global minimum risk portfolios")

legend("bottomleft", legend = c("Asymmetric t", "Gaussian"),
       col = c("black", "red"), lty = 1)

plot(t.ptf$portfolio.dist, type = "l",
     xlab = "log-loss ((-1) * log-return)", ylab = "Density")
lines(gauss.ptf$portfolio.dist, col = "red")

weights <- cbind(Asymmetric.t = t.ptf$opt.weights,
                 Gaussian = gauss.ptf$opt.weights)

barplot(weights, beside = TRUE, ylab = "Weights")




