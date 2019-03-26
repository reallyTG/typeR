library(x12)


### Name: getP-methods
### Title: 'getP' and 'setP' for retrieving and setting parameters
### Aliases: getP getP-methods getP,x12Batch-method
###   getP,x12Parameter-method getP,x12Single-method setP setP-methods
###   setP,x12Batch-method setP,x12Parameter-method setP,x12Single-method
### Keywords: methods

### ** Examples

## Not run: 
##D #Create new batch object with 4 time series
##D xb <- new("x12Batch",list(AirPassengers,AirPassengers,AirPassengers,AirPassengers))
##D # change the automdl to FALSE in all 4 elements
##D xb <- setP(xb,list(automdl=FALSE))
##D #change the arima.model and arima.smodel settings for the first ts object
##D xb <- setP(xb,list(arima.model=c(1,1,0),arima.smodel=c(1,1,0)),1)
##D #change the arima.model and arima.smodel settings for the second ts object
##D xb <- setP(xb,list(arima.model=c(0,1,1),arima.smodel=c(0,1,1)),2)
##D #change the arima.model and arima.smodel settingsfor the third ts object
##D xb <- setP(xb,list(arima.model=c(0,1,1),arima.smodel=c(1,1,1)),3)
##D #change the arima.model and arima.smodel settings for the fourth ts object
##D xb <- setP(xb,list(arima.model=c(1,1,1),arima.smodel=c(1,1,1)),4)
##D #run x12 on all series
##D xb <- x12(xb)
##D summary(xb)
##D #Set automdl=TRUE for the first ts
##D xb <- setP(xb,list(automdl=TRUE),1)
##D getP(xb,"automdl")
##D #rerun x12 on all series (the binaries will only run on the first one)
##D xb <- x12(xb)
##D #summary with oldOutput
##D summary(xb,oldOutput=10)
##D #Change the parameter and output of the first series back to the first run
##D xb <- prev(xb,index=1,n=1)
##D #summary with oldOutput (--- No valid previous runs. ---)
##D summary(xb,oldOutput=10)
## End(Not run)




