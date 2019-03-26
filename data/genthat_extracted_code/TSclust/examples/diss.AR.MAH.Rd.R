library(TSclust)


### Name: diss.AR.MAH
### Title: Model-based Dissimilarity Proposed by Maharaj (1996, 2000)
### Aliases: diss.AR.MAH
### Keywords: ~kwd1 ~kwd2

### ** Examples

## Create three sample time series
x <- arima.sim(model=list(ar=c(0.4,-0.1)), n =100, n.start=100)
y <- arima.sim(model=list(ar=c(0.9)), n =100, n.start=100)
z <- arima.sim(model=list(ar=c(0.5, 0.2)), n =100, n.start=100)
## Compute the distance and check for coherent results
diss.AR.MAH(x, y)
diss.AR.MAH(x, z)
diss.AR.MAH(y, z)

#create a dist object for its use with clustering functions like pam or hclust
diss( rbind(x,y,z), "AR.MAH")$statistic




