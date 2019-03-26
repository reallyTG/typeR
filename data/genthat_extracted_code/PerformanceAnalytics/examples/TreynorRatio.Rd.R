library(PerformanceAnalytics)


### Name: TreynorRatio
### Title: calculate Treynor Ratio or modified Treynor Ratio of excess
###   return over CAPM beta
### Aliases: TreynorRatio

### ** Examples


data(portfolio_bacon) 
data(managers)
round(TreynorRatio(managers[,1], managers[,8], Rf=.035/12),4) 
round(TreynorRatio(managers[,1], managers[,8], Rf = managers[,10]),4) 
round(TreynorRatio(managers[,1:6], managers[,8], Rf=.035/12),4) 
round(TreynorRatio(managers[,1:6], managers[,8], Rf = managers[,10]),4)
round(TreynorRatio(managers[,1:6], managers[,8:7], Rf=.035/12),4) 
round(TreynorRatio(managers[,1:6], managers[,8:7], Rf = managers[,10]),4)

print(TreynorRatio(portfolio_bacon[,1], portfolio_bacon[,2], modified = TRUE)) #expected 0.7975 

print(TreynorRatio(managers['1996',1], managers['1996',8], modified = TRUE))
print(TreynorRatio(managers['1996',1:5], managers['1996',8], modified = TRUE)) 




