library(lawstat)


### Name: runs.test
### Title: Runs Test for Randomness
### Aliases: runs.test
### Keywords: htest distribution

### ** Examples

##Simulate 100 observations from an autoregressive model 
## of the first order (AR(1))
y = arima.sim(n = 100, list(ar = c(0.5)))

##Test y for randomness
runs.test(y)

## Sample Output
##
##        Runs Test - Two sided
## data: y
## Standardized Runs Statistic = -2.8142, p-value = 0.004889



