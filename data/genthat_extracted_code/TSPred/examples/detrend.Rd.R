library(TSPred)


### Name: detrend
### Title: Detrending Transformation
### Aliases: detrend detrend.rev
### Keywords: detrending trend transform time series

### ** Examples

data(CATS,CATS.cont)
fpoly <- fittestPolyR(CATS[,1],h=20)
trend <- fitted(fpoly$model)

residuals <- detrend(CATS[,1],trend)
x <- detrend.rev(residuals,trend)



