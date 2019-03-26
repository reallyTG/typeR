library(x12)


### Name: summary-methods
### Title: ~~ Methods for Function 'summary' in Package 'x12' ~~
### Aliases: summary-methods summary,x12Output-method
###   summary,x12Single-method summary,x12Batch-method summary

### ** Examples


## Not run: 
##D # Summary of an "x12Single" object
##D x12path("../x12a.exe")
##D s <- new("x12Single",ts=AirPassengers,tsName="air")
##D s <- setP(s,list(estimate=TRUE,regression.variables="AO1950.1",outlier.types="all",
##D   outlier.critical=list(LS=3.5,TC=2.5),backcast_years=1/2))
##D s <- x12(s)
##D summary.output<-summary(s)
##D s <- x12(setP(s,list(arima.model=c(0,1,1),arima.smodel=c(0,2,1))))
##D summary.output<-summary(s,oldOutput=1)
##D s <- x12(setP(s,list(arima.model=c(0,1,1),arima.smodel=c(1,0,1))))
##D summary.output<-summary(s,fullSummary=TRUE,oldOutput=2)
##D 
##D # Summary of an "x12Batch" object
##D xb <- new("x12Batch",list(AirPassengers,AirPassengers,
##D 				AirPassengers),tsName=c("air1","air2","air3"))
##D xb <- x12(xb)
##D xb <- setP(xb,list(arima.model=c(1,1,0),arima.smodel=c(1,1,0)),1)
##D xb <- x12(xb)
##D xb <- setP(xb,list(regression.variables=c("AO1955.5","AO1956.1","ao1959.3")),1)
##D xb <- setP(xb,list(regression.variables=c("AO1955.4")),2)
##D xb<- x12(xb)
##D xb <- setP(xb,list(outlier.types="all"))
##D xb <- setP(xb,list(outlier.critical=list(LS=3.5,TC=2.5)),1)
##D xb <- setP(xb,list(regression.variables=c("lpyear")),3)
##D xb<- x12(xb)
##D summary.output<-summary(xb,oldOutput=3)
## End(Not run)



