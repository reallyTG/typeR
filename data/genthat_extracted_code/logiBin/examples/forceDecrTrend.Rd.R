library(logiBin)


### Name: forceDecrTrend
### Title: Force a numerical variable to follow a monotonically decreasing
###   trend
### Aliases: forceDecrTrend

### ** Examples

b1 <- getBins(loanData, "bad_flag", c('age', 'score'), minCr=0.6, minProp = 0.01)
b1 <- forceDecrTrend(b1, c('score','age'))




