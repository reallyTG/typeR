library(lmtest)


### Name: moneydemand
### Title: Money Demand
### Aliases: moneydemand
### Keywords: datasets

### ** Examples

data(moneydemand)
moneydemand <- window(moneydemand, start=1880, end=1972)

## page 125, fit Allen OLS model (and Durbin-Watson test),
## last line in Table 6.1

modelAllen <- logM ~ logYp + Rs + Rl + logSpp
lm(modelAllen, data = moneydemand)
dwtest(modelAllen, data = moneydemand)

## page 127, fit test statistics in Table 6.1 c)
################################################

## Breusch-Pagan
bptest(modelAllen, studentize = FALSE, data = moneydemand)
bptest(modelAllen, studentize = TRUE, data = moneydemand)

## RESET
reset(modelAllen, data = moneydemand)
reset(modelAllen, power = 2, type = "regressor", data = moneydemand)
reset(modelAllen, type = "princomp", data = moneydemand)

## Harvey-Collier tests (up to sign of the test statistic)
harvtest(modelAllen, order.by = ~logYp, data = moneydemand)
harvtest(modelAllen, order.by = ~Rs, data = moneydemand)
harvtest(modelAllen, order.by = ~Rl, data = moneydemand)
harvtest(modelAllen, order.by = ~logSpp, data = moneydemand)

## Rainbow test
raintest(modelAllen, order.by = "mahalanobis", data = moneydemand)


if(require(strucchange, quietly = TRUE)) {
## Chow (1913)
sctest(modelAllen, point=c(1913,1), data = moneydemand, type = "Chow") }

if(require(strucchange, quietly = TRUE)) {
## Fluctuation
sctest(modelAllen, type = "fluctuation", rescale = FALSE, data = moneydemand)}



