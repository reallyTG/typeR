library(PerformanceAnalytics)


### Name: MarketTiming
### Title: Market timing models
### Aliases: MarketTiming

### ** Examples


data(managers)
MarketTiming(managers[,1], managers[,8], Rf=.035/12, method = "HM")
MarketTiming(managers[80:120,1:6], managers[80:120,7], managers[80:120,10])
MarketTiming(managers[80:120,1:6], managers[80:120,8:7], managers[80:120,10], method = "TM")




