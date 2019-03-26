library(TSclust)


### Name: diss
### Title: TSclust Dissimilarity Computation
### Aliases: diss
### Keywords: ~kwd1 ~kwd2

### ** Examples

data(electricity)
diss(electricity, METHOD="INT.PER", normalize=FALSE)

## Example of multivalued, one per series argument
## The AR.LPC.CEPS dissimilarity allows the specification of the ARIMA model for each series
## Create three sample time series and a mts object
x <- arima.sim(model=list(ar=c(0.4,-0.1)), n =100, n.start=100)
y <- arima.sim(model=list(ar=c(0.9)), n =100, n.start=100)
z <- arima.sim(model=list(ar=c(0.5, 0.2)), n =100, n.start=100)
seriests <- rbind(x,y,z)

## If we want to provide the ARIMA order for each series
## and use it with AR.LPC.CEPS, we create a matrix with the row-wise orders
orderx <- c(2,0,0) 
ordery <- c(1,0,0)
orderz <- c(2,0,0)
orders = rbind(orderx, ordery, orderz)

diss( seriests, METHOD="AR.LPC.CEPS", k=30, order= orders )

##other examples
diss( seriests, METHOD="MINDIST.SAX", w=10, alpha=4 )
diss( seriests, METHOD="PDC" )



