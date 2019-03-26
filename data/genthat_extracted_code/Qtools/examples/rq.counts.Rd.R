library(Qtools)


### Name: rq.counts
### Title: Quantile Regression for Counts
### Aliases: rq.counts
### Keywords: conditional quantiles discrete

### ** Examples


# Esterase data
data(esterase)

# Fit quantiles 0.25 and 0.75
fit1 <- rq.counts(Count ~ Esterase, tau = 0.25, data = esterase, M = 50)
coef(fit1)
fit2 <- rq.counts(Count ~ Esterase, tau = 0.75, data = esterase, M = 50)
coef(fit2)

# Plot
with(esterase, plot(Count ~ Esterase))
lines(esterase$Esterase, fit1$fitted.values, col = "blue")
lines(esterase$Esterase, fit2$fitted.values, col = "red")
legend(8, 1000, lty = c(1,1), col = c("blue", "red"), legend = c("tau = 0.25","tau = 0.75"))




