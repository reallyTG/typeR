library(PerformanceAnalytics)


### Name: to.period.contributions
### Title: Aggregate contributions through time
### Aliases: to.period.contributions to.monthly.contributions
###   to.weekly.contributions to.quarterly.contributions
###   to.yearly.contributions

### ** Examples

data(managers, package="PerformanceAnalytics")

res_qtr_rebal = Return.portfolio(  managers["2002::",1:5]
                                 , weights=c(.05,.1,.3,.4,.15)
                                 , rebalance_on = "quarters"
                                 , verbose=TRUE)
                                 
to.period.contributions(res_qtr_rebal$contribution, period="years")
to.yearly.contributions(res_qtr_rebal$contribution)




