library(tools4uplift)


### Name: DualUplift
### Title: Two-model estimator
### Aliases: DualUplift
### Keywords: uplift

### ** Examples


library(tools4uplift)
data("SimUplift")

fit <- DualUplift(SimUplift, "treat", "y", predictors = colnames(SimUplift[, 3:12]))




