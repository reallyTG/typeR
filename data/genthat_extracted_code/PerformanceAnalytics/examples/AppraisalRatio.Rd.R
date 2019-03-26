library(PerformanceAnalytics)


### Name: AppraisalRatio
### Title: Appraisal ratio of the return distribution
### Aliases: AppraisalRatio

### ** Examples


data(portfolio_bacon)
print(AppraisalRatio(portfolio_bacon[,1], portfolio_bacon[,2], method="appraisal")) #expected -0.430
print(AppraisalRatio(portfolio_bacon[,1], portfolio_bacon[,2], method="modified")) 
print(AppraisalRatio(portfolio_bacon[,1], portfolio_bacon[,2], method="alternative"))

data(managers)
print(AppraisalRatio(managers['1996',1], managers['1996',8]))
print(AppraisalRatio(managers['1996',1:5], managers['1996',8]))




