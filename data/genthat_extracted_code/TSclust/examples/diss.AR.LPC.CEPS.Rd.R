library(TSclust)


### Name: diss.AR.LPC.CEPS
### Title: Dissimilarity Based on LPC Cepstral Coefficients
### Aliases: diss.AR.LPC.CEPS
### Keywords: ~kwd1 ~kwd2

### ** Examples

## Create three sample time series
x <- arima.sim(model=list(ar=c(0.4,-0.1)), n =100, n.start=100)
y <- arima.sim(model=list(ar=c(0.9)), n =100, n.start=100)
z <- arima.sim(model=list(ar=c(0.5, 0.2)), n =100, n.start=100)
## Compute the distance and check for coherent results
diss.AR.LPC.CEPS(x, y, 25) #impose an AR automatically selected for both series
#impose an ARIMA(2,0,0) for series x and an AR automatically selected for z
diss.AR.LPC.CEPS(x, z, 25, order.x = c(2,0,0), order.y = NULL ) 
diss.AR.LPC.CEPS(y, z, 25)
#create a dist object for its use with clustering functions like pam or hclust

diss( rbind(x,y,z), METHOD="AR.LPC.CEPS", k=20, order=rbind(c(2,0,0), c(1,0,0), c(2,0,0)),
 seasonal=list( list(order=c(1,0,0), period=1), list(order=c(2,0,0), period=3),
  list(order=c(1,0,0), period=1)) )




