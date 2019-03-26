library(PerformanceAnalytics)


### Name: CalmarRatio
### Title: calculate a Calmar or Sterling reward/risk ratio Calmar and
###   Sterling Ratios are yet another method of creating a risk-adjusted
###   measure for ranking investments similar to the 'SharpeRatio'.
### Aliases: CalmarRatio SterlingRatio SterlingRatio

### ** Examples


    data(managers)
    CalmarRatio(managers[,1,drop=FALSE])
    CalmarRatio(managers[,1:6]) 
    SterlingRatio(managers[,1,drop=FALSE])
    SterlingRatio(managers[,1:6])




