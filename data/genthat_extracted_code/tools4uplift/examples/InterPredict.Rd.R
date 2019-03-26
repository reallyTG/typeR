library(tools4uplift)


### Name: InterPredict
### Title: Predictions from an interaction estimator
### Aliases: InterPredict
### Keywords: prediction uplift

### ** Examples


library(tools4uplift)
data("SimUplift")

fit <- InterUplift(SimUplift, "treat", "y", colnames(SimUplift[, 3:12]))

pred <- InterPredict(SimUplift, "treat", "y", model = fit, nb.group = 5)[[1]]




