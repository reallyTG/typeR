library(NTS)


### Name: backtest
### Title: Backtest
### Aliases: backtest

### ** Examples

data=arima.sim(n=100,list(ar=c(0.5,0.3)))
model=arima(data,order=c(2,0,0))
backtest(model,data,orig=70,h=1)



