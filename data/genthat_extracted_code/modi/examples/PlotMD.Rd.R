library(modi)


### Name: PlotMD
### Title: QQ-Plot of Mahalanobis distances
### Aliases: PlotMD

### ** Examples

data(bushfirem, bushfire.weights)
det.res <- TRC(bushfirem, weights = bushfire.weights)
PlotMD(det.res$dist, ncol(bushfirem))



