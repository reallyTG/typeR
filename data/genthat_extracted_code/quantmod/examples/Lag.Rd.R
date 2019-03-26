library(quantmod)


### Name: Lag
### Title: Lag a Time Series
### Aliases: Lag Lag.quantmod.OHLC Lag.zoo Lag.data.frame Lag.numeric
### Keywords: ts datagen misc

### ** Examples

Stock.Close <- c(102.12,102.62,100.12,103.00,103.87,103.12,105.12)
Close.Dates <- as.Date(c(10660,10661,10662,10665,10666,10667,10668),origin="1970-01-01")
Stock.Close <- zoo(Stock.Close,Close.Dates)

Lag(Stock.Close)        #lag by 1 period
Lag(Stock.Close,k=1)    #same
Lag(Stock.Close,k=1:3)  #lag 1,2 and 3 periods




