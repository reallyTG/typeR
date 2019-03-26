library(PerformanceAnalytics)


### Name: SortinoRatio
### Title: calculate Sortino Ratio of performance over downside risk
### Aliases: SortinoRatio

### ** Examples


data(managers)
round(SortinoRatio(managers[, 1]),4)
round(SortinoRatio(managers[, 1:8]),4)




