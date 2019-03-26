library(pastecs)


### Name: trend.test
### Title: Test if an increasing or decreasing trend exists in a time
###   series
### Aliases: trend.test
### Keywords: ts htest

### ** Examples

data(marbio)
trend.test(marbio[, 8])
# Run a bootstrap test on the same series
marbio8.trend.test <- trend.test(marbio[, 8], R=99)
# R=999 is a better value... but it is very slow!
marbio8.trend.test  
plot(marbio8.trend.test)
marbio8.trend.test$p.value



