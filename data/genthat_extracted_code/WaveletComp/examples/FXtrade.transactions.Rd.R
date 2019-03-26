library(WaveletComp)


### Name: FXtrade.transactions
### Title: Series of FX trade transactions
### Aliases: FXtrade.transactions
### Keywords: datasets

### ** Examples

data(FXtrade.transactions)
plot(as.POSIXct(FXtrade.transactions$date, format = "%F %T", tz = "GMT"),
     FXtrade.transactions$transactions, 
     type = "l",
     xlab = "day", ylab = "transactions in 5-minute intervals")



