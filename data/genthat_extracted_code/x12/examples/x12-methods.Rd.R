library(x12)


### Name: x12
### Title: ~~ Methods for Function 'x12' in Package 'x12' ~~
### Aliases: x12 x12-methods x12,ts-method x12,x12Batch-method
###   x12,x12Single-method
### Keywords: methods

### ** Examples

xts <- x12(AirPassengers)
summary(xts)
xs <- x12(new("x12Single",ts=AirPassengers))
summary(xs)

## Not run: 
##D xb<-x12(new("x12Batch",list(AirPassengers,AirPassengers,AirPassengers)))
##D summary(xb)
##D 
##D #Create new batch object with 4 time series
##D xb <- new("x12Batch",list(AirPassengers,AirPassengers,AirPassengers,AirPassengers))
##D 
##D # change the automdl to FALSE in all 4 elements
##D xb <- setP(xb,list(automdl=FALSE))
##D #change the arima.model and arima.smodel setting for the first ts object
##D xb <- setP(xb,list(arima.model=c(1,1,0),arima.smodel=c(1,1,0)),1)
##D #change the arima.model and arima.smodel setting for the second ts object
##D xb <- setP(xb,list(arima.model=c(0,1,1),arima.smodel=c(0,1,1)),2)
##D #change the arima.model and arima.smodel setting for the third ts object
##D xb <- setP(xb,list(arima.model=c(0,1,1),arima.smodel=c(1,1,1)),3)
##D #change the arima.model and arima.smodel setting for the fourth ts object
##D xb <- setP(xb,list(arima.model=c(1,1,1),arima.smodel=c(1,1,1)),4)
##D #run x12 on all series
##D xb <- x12(xb)
##D summary(xb)
##D 
##D #Set automdl=TRUE for the first ts
##D xb <- setP(xb,list(automdl=TRUE),1)
##D 
##D #rerun x12 on all series (the binaries will only run on the first one)
##D xb <- x12(xb)
##D 
##D #summary with oldOutput
##D summary(xb,oldOutput=10)
##D 
##D #Change the parameter and output of the first series back to the first run
##D xb <- prev(xb,index=1,n=1)
##D 
##D #summary with oldOutput (--- No valid previous runs. ---)
##D summary(xb,oldOutput=10)
## End(Not run)



