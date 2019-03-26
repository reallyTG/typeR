library(Qtools)


### Name: rrq
### Title: Restricted Regression Quantiles
### Aliases: rrq.fit rrq.wfit rrq
### Keywords: quantile crossing conditional quantiles

### ** Examples

data(esterase)

# Fit standard quantile regression
fit <- quantreg::rq(Count ~ Esterase, data = esterase, tau = c(.1,.25,.5,.75,.9))
yhat <- fit$fitted.values

# Fit restricted quantile regression
fitr <- rrq(Count ~ Esterase, data = esterase, tau = c(.1,.25,.5,.75,.9))
yhat2 <- predict(fitr)


# Plot results
par(mfrow = c(1, 2))

# Plot regression quantiles
with(esterase, plot(Count ~ Esterase, pch = 16, cex = .8))
apply(yhat, 2, function(y,x) lines(x,y,lwd = 1.5), x = esterase$Esterase)

# Plot restricted regression quantiles
with(esterase, plot(Count ~ Esterase, pch = 16, cex = .8))
apply(yhat2, 2, function(y,x) lines(x,y,lwd = 1.5), x = esterase$Esterase)




