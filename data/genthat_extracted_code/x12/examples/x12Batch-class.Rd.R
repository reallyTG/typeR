library(x12)


### Name: x12Batch-class
### Title: Class '"x12Batch"'
### Aliases: x12Batch-class dim,x12Batch-method length,x12Batch-method
###   x12Batch
### Keywords: classes

### ** Examples

## Not run: 
##D #object containing 4 time series and the corresponding parameters and output
##D data(AirPassengersX12Batch)
##D summary(AirPassengersX12Batch)
##D #summary with oldOutput
##D summary(AirPassengersX12Batch,oldOutput=10)
##D #Change the parameter and output of the first series back to the first run
##D AirPassengersX12Batch <- prev(AirPassengersX12Batch,index=1,n=1)
##D #summary with oldOutput (--- No valid previous runs. ---)
##D summary(AirPassengersX12Batch,oldOutput=10)
##D 
##D #Create new batch object with 4 time series
##D xb <- new("x12Batch",list(AirPassengers,ldeaths,nottem,UKgas),
##D   c("Air","ldeaths","nottem","UKgas"))
##D # change outlier.types to "all" in all 4 elements
##D xb <- setP(xb,list(outlier.types="all"))
##D #change the arima.model and arima.smodel setting for the first ts object
##D xb <- setP(xb,list(arima.model=c(0,1,1),arima.smodel=c(0,1,1)),1)
##D #change the arima.model and arima.smodel setting for the second ts object
##D xb <- setP(xb,list(arima.model=c(0,1,1),arima.smodel=c(0,1,1)),2)
##D #change the arima.model and arima.smodel setting for the third ts object
##D xb <- setP(xb,list(arima.model=c(0,1,1),arima.smodel=c(0,1,1)),3)
##D #change the arima.model and arima.smodel setting for the fourth ts object
##D xb <- setP(xb,list(arima.model=c(0,1,1),arima.smodel=c(0,1,1)),4)
##D #run x12 on all series
##D xb <- x12(xb)
##D summary(xb)
##D #Set automdl=TRUE for the first ts
##D xb <- setP(xb,list(automdl=TRUE),1)
##D #rerun x12 on all series (the binaries will only run on the first one)
##D xb <- x12(xb)
##D #summary with oldOutput
##D summary(xb,oldOutput=10)
##D #Change the parameter and output of the first series back to the first run
##D xb <- prev(xb,index=1,n=1)
##D #summary with oldOutput (--- No valid previous runs. ---)
##D summary(xb,oldOutput=10)
##D 
##D #Create new batch object by combining objects of class x12Single
##D s1 <- new("x12Single",ts=AirPassengers,tsName="air")
##D s1 <- setP(s1,list(estimate=TRUE,regression.variables="AO1950.1",outlier.types="all",
##D   outlier.critical=list(LS=3.5,TC=2.5)))
##D s2 <- new("x12Single",ts=UKgas,tsName="UKgas")
##D s2 <- setP(s2,list(slidingspans=TRUE,history=TRUE,
##D   history.estimates=c("sadj","sadjchng","trend","trendchng","seasonal","aic"),
##D   history.sadjlags=c(1,2),automdl=TRUE))
##D b <- new("x12Batch",list(s1,s2))
##D b <- x12(b)
## End(Not run)



