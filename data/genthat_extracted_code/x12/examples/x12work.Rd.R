library(x12)


### Name: x12work
### Title: Run x12 on an R TS-object
### Aliases: x12work

### ** Examples

### Examples
data(AirPassengers)
## Not run: 
##D x12out <- x12work(AirPassengers,x12path=".../x12a.exe",transform.function="auto",
##D 		arima.model=c(0,1,1),arima.smodel=c(0,1,1),regression.variables="lpyear",
##D 		x11.sigmalim=c(2.0,3.0),outlier.types="all",outlier.critical=list(LS=3.5,TC=3),
##D 		x11.seasonalma="s3x3")
##D summary(x12out)
## End(Not run)	



