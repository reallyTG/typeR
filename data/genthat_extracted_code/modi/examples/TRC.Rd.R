library(modi)


### Name: TRC
### Title: Transformed rank correlations for multivariate outlier detection
### Aliases: TRC

### ** Examples

data(bushfirem, bushfire.weights)
det.res <- TRC(bushfirem, weights = bushfire.weights)
PlotMD(det.res$dist, ncol(bushfirem))
print(det.res)



