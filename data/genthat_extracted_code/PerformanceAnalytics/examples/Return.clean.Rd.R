library(PerformanceAnalytics)


### Name: Return.clean
### Title: clean returns in a time series to to provide more robust risk
###   estimates
### Aliases: Return.clean

### ** Examples


data(managers)
head(Return.clean(managers[,1:4]),n=20)
chart.BarVaR(managers[,1,drop=FALSE], show.clean=TRUE, clean="boudt", lwd=2, methods="ModifiedVaR")




