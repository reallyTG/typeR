library(tools4uplift)


### Name: DualPredict
### Title: Predictions from a two-model estimator
### Aliases: DualPredict
### Keywords: prediction uplift

### ** Examples


library(tools4uplift)
data("SimUplift")

fit <- DualUplift(SimUplift, "treat", "y", predictors = colnames(SimUplift[, 3:12]))

pred <- DualPredict(SimUplift, "treat", "y", model = fit, nb.group = 5)[[1]]




