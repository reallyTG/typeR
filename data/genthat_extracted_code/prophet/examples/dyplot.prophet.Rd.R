library(prophet)


### Name: dyplot.prophet
### Title: Plot the prophet forecast.
### Aliases: dyplot.prophet

### ** Examples

## Not run: 
##D history <- data.frame(
##D  ds = seq(as.Date('2015-01-01'), as.Date('2016-01-01'), by = 'd'),
##D  y = sin(1:366/200) + rnorm(366)/10)
##D m <- prophet(history)
##D future <- make_future_dataframe(m, periods = 365)
##D forecast <- predict(m, future)
##D dyplot.prophet(m, forecast)
## End(Not run)




