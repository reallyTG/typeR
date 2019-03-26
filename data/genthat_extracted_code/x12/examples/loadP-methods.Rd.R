library(x12)


### Name: loadP
### Title: 'loadP' and 'saveP'
### Aliases: loadP-methods loadP,x12Batch-method loadP,x12Parameter-method
###   loadP,x12Single-method saveP-methods saveP,x12Batch-method
###   saveP,x12Parameter-method saveP,x12Single-method saveP loadP
### Keywords: methods

### ** Examples

## Not run: 
##D #Create new batch object with 4 time series and change some parameters
##D xb <- new("x12Batch",list(AirPassengers,AirPassengers,AirPassengers,AirPassengers))
##D xb <- setP(xb,list(automdl=FALSE))
##D xb <- setP(xb,list(arima.model=c(1,1,0),arima.model=c(1,1,0)),1)
##D xb <- setP(xb,list(arima.model=c(0,1,1),arima.smodel=c(0,1,1)),2)
##D xb <- setP(xb,list(arima.model=c(0,1,1),arima.smodel=c(1,1,1)),3)
##D xb <- setP(xb,list(arima.model=c(1,1,1),arima.smodel=c(1,1,1)),4)
##D 
##D #save all parameters
##D saveP(xb,file="xyz.RData")
##D xb1 <- new("x12Batch",list(AirPassengers,AirPassengers,AirPassengers,AirPassengers))
##D 
##D #load all parameters and save it to the corresponding series inside a x12Batch-object
##D xb1 <- loadP(xb1,file="xyz.RData")
##D 
##D 
##D xs <- new("x12Single",ts=AirPassengers)
##D xs <- setP(xs,list(arima.model=c(2,1,1),arima.smodel=c(2,1,1)))
##D #Save the parameters
##D saveP(xs,file="xyz1.RData")
##D 
##D #Load a saved parameter set to a x12Single object
##D xs <- new("x12Single",ts=AirPassengers)
##D xs <- loadP(xs,file="xyz1.RData")
##D 
##D #Replace all parameters in a x12Batch object with one parameter set
##D xb <- new("x12Batch",list(AirPassengers,AirPassengers,AirPassengers,AirPassengers))
##D xb <- loadP(xb,file="xyz1.RData")
## End(Not run)



