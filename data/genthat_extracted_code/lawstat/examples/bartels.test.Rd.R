library(lawstat)


### Name: bartels.test
### Title: Ranked Version of von Neumann's Ratio Test for Randomness
### Aliases: bartels.test
### Keywords: htest distribution

### ** Examples

## Simulate 100 observations from an autoregressive model of 
## the first order AR(1)
y = arima.sim(n = 100, list(ar = c(0.5)))

## Test y for randomness
bartels.test(y)

## Sample Output
##
##        Bartels Test - Two sided
## data:  y
## Standardized Bartels Statistic -4.4929, RVN Ratio =
## 1.101, p-value = 7.024e-06



