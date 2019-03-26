library(ePCR)


### Name: heatcv
### Title: Plot a heatmap of the prediction performance statistic as a
###   function of lambda and alpha combinations
### Aliases: heatcv

### ** Examples

data(ePCRmodels)
par(mfrow=c(1,3))
heatcv(DREAM@PSPs[[1]], main=DREAM@PSPs[[1]]@description, by.rownames=10, by.colnames=10)
heatcv(DREAM@PSPs[[2]], main=DREAM@PSPs[[2]]@description, by.rownames=10, by.colnames=10)
heatcv(DREAM@PSPs[[3]], main=DREAM@PSPs[[3]]@description, by.rownames=10, by.colnames=10)



