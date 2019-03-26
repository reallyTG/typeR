library(KFKSDS)


### Name: predict.stsmSS
### Title: Kalman Filter for State Space Models
### Aliases: predict.stsmSS
### Keywords: ts, model

### ** Examples

## local level model
## Nile time series
require("stsm")
y <- Nile
m <- stsm::stsm.model(model = "local-level", y = y, transPars = "StructTS")
fit <- StructTS(y, "level")
m <- stsm::set.pars(m, as.vector(fit$coef[c(2,1)]) * 100 / var(y))
ss <- stsm::char2numeric(m, P0cov = TRUE)
res <- predict(ss, y, 5)

# display forecasts and confidence intervals
plot(cbind(y, res$pred), type = "n", plot.type = "single")
lines(y)
lines(res$pred, col = "blue")
lines(res$pred + 2 * res$se, col = "red", lty = 2)
lines(res$pred - 2 * res$se, col = "red", lty = 2)

# for the whole series, the above is the same as "predict.StructTS" 
all.equal(res$pred, predict(fit, 5)$pred)
all.equal(res$se, predict(fit, 5)$se)

## basic Structural model
## AirPassengers time series (in logarithms)
y <- log(AirPassengers)
m <- stsm::stsm.model(model = "BSM", y = y, transPars = "StructTS")
fit <- StructTS(y, "BSM")
m <- stsm::set.pars(m, as.vector(fit$coef[c(4,1:3)]) * 100 / var(y))
ss <- stsm::char2numeric(m, P0cov = TRUE)
res <- predict(ss, y, 12)

all.equal(res$pred, predict(fit, 12)$pred)
all.equal(res$se, predict(fit, 12)$se)

# forecasts and confidence intervals for the series
# scaled back to original scale
expy <- exp(y)
plot(cbind(expy, exp(res$pred + 2 * res$se)), type = "n", plot.type = "single")
lines(expy)
lines(exp(res$pred), col = "blue")
lines(exp(res$pred + 2 * res$se), col = "red", lty = 2)
lines(exp(res$pred - 2 * res$se), col = "red", lty = 2)

# forecasts for the trend component
# the aproach in StructTS() seems to seasonal fluctuations in the trend
# see the "stsm" package for a more flexible interface for maximum likelihood 
# procedures to fit a structural time series model
trend <- exp(fitted(fit)[,1])
plot(cbind(trend, AirPassengers), type = "n", plot.type = "single")
lines(AirPassengers, col = "gray")
lines(trend)
lines(exp(res$a[,1]), col = "blue")
lines(exp(res$a[,1] + 2 * sqrt(res$P[,1])), col = "red", lty = 2)
lines(exp(res$a[,1] - 2 * sqrt(res$P[,1])), col = "red", lty = 2)

# forecasts for the seasonal component
seas <- exp(fitted(fit)[,3])
plot(cbind(seas, exp(res$a[,3]) + 2 * sqrt(res$P[,3])), 
  type = "n", plot.type = "single")
lines(seas)
lines(exp(res$a[,3]), col = "blue")
lines(exp(res$a[,3] + 2 * sqrt(res$P[,3])), col = "red", lty = 2)
lines(exp(res$a[,3] - 2 * sqrt(res$P[,3])), col = "red", lty = 2)



