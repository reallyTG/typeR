library(PerformanceAnalytics)


### Name: table.Arbitrary
### Title: wrapper function for combining arbitrary function list into a
###   table
### Aliases: table.Arbitrary statsTable

### ** Examples


data(edhec)
table.Arbitrary(edhec,metrics=c("VaR", "ES"),
                metricsNames=c("Modified VaR","Modified Expected Shortfall"))




