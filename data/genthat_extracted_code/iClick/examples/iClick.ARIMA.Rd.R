library(iClick)


### Name: iClick.ARIMA
### Title: iClick GUI for ARIMA
### Aliases: iClick.ARIMA

### ** Examples


##External data
data("world20")
y=na.omit(diff(log(world20[,1])))

## Simulation data
#dat=rnorm(200,5,1)
#y=ts(dat, start = c(1970, 1), frequency = 12)

iClick.ARIMA(y)

#More
iClick.ARIMA(y,AR = 2, MA = 2, n.ahead = 12, ic = "bic")




