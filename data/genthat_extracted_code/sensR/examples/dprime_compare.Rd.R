library(sensR)


### Name: dprime_compare
### Title: Test the 'any-differences' hypothesis and estimate common
###   d-prime
### Aliases: dprime_compare
### Keywords: models

### ** Examples


## Make some fake data:
n <- rep(40, 4)
x <- c(25, 25, 30, 35)
protocol <- c("triangle", "duotrio", "threeAFC", "twoAFC")
## Look at the data table with d-primes etc.:
dprime_table(x, n, protocol)

## 'any differences' test:
## ML estimation and test with likelihood statistic:
(dpc <- dprime_compare(x, n, protocol))
## Other estimation/statistic options:
dprime_compare(x, n, protocol, estim="weighted.avg")
dprime_compare(x, n, protocol, statistic="Pearson")
dprime_compare(x, n, protocol, statistic="Wald.p")
dprime_compare(x, n, protocol, statistic="Wald.d")




