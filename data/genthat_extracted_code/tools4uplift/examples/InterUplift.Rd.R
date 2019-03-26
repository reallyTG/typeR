library(tools4uplift)


### Name: InterUplift
### Title: Interaction estimator
### Aliases: InterUplift
### Keywords: uplift

### ** Examples


library(tools4uplift)
data("SimUplift")

fit <- InterUplift(SimUplift, "treat", "y", colnames(SimUplift[, 3:12]))




