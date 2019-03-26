library(aTSA)


### Name: identify
### Title: Identify a Time Series Model
### Aliases: identify

### ** Examples

x <- arima.sim(list(order = c(2,0,0),ar = c(0.2,0.4)),n = 100)
identify(x) # white noise check
identify(x,stat.test = TRUE) # white noise and stationarity check
identify(x,p = 3,q = 2) # white noise check and optimal model identification.



