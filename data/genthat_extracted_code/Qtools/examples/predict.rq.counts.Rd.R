library(Qtools)


### Name: predict.rq.counts
### Title: Predictions from rq.counts Objects
### Aliases: predict.rq.counts
### Keywords: predict

### ** Examples


# Esterase data
data(esterase)

# Fit quantiles 0.25 and 0.75
fit <- rq.counts(Count ~ Esterase, tau = 0.5, data = esterase, M = 50)
cbind(fit$fitted.values, predict(fit, type = "response"))




