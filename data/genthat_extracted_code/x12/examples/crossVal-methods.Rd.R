library(x12)


### Name: crossVal
### Title: ~~ Methods for Function 'crossVal' in Package 'x12' ~~
### Aliases: crossVal crossVal-methods crossVal,ts-method
###   crossVal,x12Single-method
### Keywords: methods

### ** Examples

## Not run: 
##D s <- new("x12Single",ts=AirPassengers,tsName="air")
##D s <- setP(s,list(estimate=TRUE,regression.variables="AO1950.1",outlier.types="all",
##D   outlier.critical=list(LS=3.5,TC=2.5),
##D backcast_years=1/2,forecast_years=1))
##D 
##D cv<-crossVal(s,showLine=TRUE)
##D cv
## End(Not run)



