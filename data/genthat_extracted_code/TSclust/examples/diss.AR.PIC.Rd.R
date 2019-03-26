library(TSclust)


### Name: diss.AR.PIC
### Title: Model-based Dissimilarity Measure Proposed by Piccolo (1990)
### Aliases: diss.AR.PIC
### Keywords: ~kwd1 ~kwd2

### ** Examples

## Create three sample time series
x <- arima.sim(model=list(ar=c(0.4,-0.1)), n =100, n.start=100)
y <- arima.sim(model=list(ar=c(0.9)), n =100, n.start=100)
z <- arima.sim(model=list(ar=c(0.5, 0.2)), n =100, n.start=100)
## Compute the distance and check for coherent results
#ARIMA(2,0,0) for x and ARIMA(1,0,0) for y
diss.AR.PIC( x, y, order.x = c(2,0,0), order.y = c(1,0,0) )
diss.AR.PIC( x, z, order.x = c(2,0,0), order.y = c(2,0,0) )
# AR for y (automatically selected) and ARIMA(2,0,0) for z
diss.AR.PIC( y, z, order.x=NULL, order.y=c(2,0,0) ) 
#create a dist object for its use with clustering functions like pam or hclust
diss( rbind(x,y,z), METHOD="AR.PIC", order=rbind(c(2,0,0), c(1,0,0), c(2,0,0)) )




