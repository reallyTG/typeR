library(logiBin)


### Name: forceIncrTrend
### Title: Force a numerical variable to follow a monotonically increasing
###   trend
### Aliases: forceIncrTrend

### ** Examples

b1 <- getBins(loanData, "bad_flag", c('age', 'score'), minCr=0.6, minProp = 0.01)
b1 <- forceIncrTrend(b1, c('score','age'))




