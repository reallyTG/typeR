library(modi)


### Name: GIMCD
### Title: Gaussian imputation followed by MCD
### Aliases: GIMCD

### ** Examples

data(bushfirem)
det.res <- GIMCD(bushfirem, alpha = 0.1)
print(det.res$center)
PlotMD(det.res$dist, ncol(bushfirem))



