library(thief)


### Name: thief
### Title: Temporal hierarchical forecasting
### Aliases: thief

### ** Examples

## Not run: 
##D 
##D # Select ARIMA models for all series using auto.arima()
##D z <- thief(AEdemand[,12], usemodel='arima')
##D plot(z)
##D 
##D # Use your own function
##D ftbats <- function(y,h,...){forecast(tbats(y),h,...)}
##D z <- thief(AEdemand[,12], forecastfunction=ftbats)
##D plot(z)
## End(Not run)




