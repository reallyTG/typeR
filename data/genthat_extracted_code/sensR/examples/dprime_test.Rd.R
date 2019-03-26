library(sensR)


### Name: dprime_test
### Title: Test of simple hypothesis with the common d-prime
### Aliases: dprime_test
### Keywords: models

### ** Examples


n <- rep(40, 4)
x <- c(25, 25, 30, 35)
protocol <- c("triangle", "duotrio", "threeAFC", "twoAFC")
## Look at the data table with d-primes etc.:
dprime_table(x, n, protocol)

## Test of common d':
dprime_test(x, n, protocol)

## Another setting:
dprime_test(x, n, protocol, dprime0=2, statistic="Wald",
            alternative="less", estim="weighted.avg")




