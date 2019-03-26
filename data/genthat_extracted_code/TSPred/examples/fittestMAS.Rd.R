library(TSPred)


### Name: fittestMAS
### Title: Automatic prediction with moving average smoothing
### Aliases: fittestMAS
### Keywords: moving average smoother automatic fitting adjustment
###   prediction evaluation criterion errors time series

### ** Examples

data(CATS)
## Not run: 
##D fMAS <- fittestMAS(CATS[,1],h=20,model="arima")
##D 
##D #automatically selected order of moving average
##D mas.order <- fMAS$order
## End(Not run)



