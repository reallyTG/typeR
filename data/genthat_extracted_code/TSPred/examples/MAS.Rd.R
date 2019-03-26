library(TSPred)


### Name: MAS
### Title: Moving average smoothing
### Aliases: MAS MAS.rev
### Keywords: moving average smoother transform time series

### ** Examples

data(CATS)
## Not run: 
##D #automatically select order of moving average
##D order <- fittestMAS(CATS[,1],h=20,model="arima")$order
## End(Not run)

order <- 5
m <- MAS(CATS[,1],order=order)

xinit <- head(CATS[,1],order-1)
x <- MAS.rev(m,xinit,order,addinit=TRUE)

all(round(x,4)==round(CATS[,1],4))



