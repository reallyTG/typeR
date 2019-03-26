library(fxregime)


### Name: fxtools
### Title: Various Tools for Exchange Rate Regime Classification
### Aliases: fxpegtest
### Keywords: regression

### ** Examples

## load package and data
library("fxregime")
data("FXRatesCHF", package = "fxregime")

## compute returns for CNY (and explanatory currencies)
## after abolishing fixed USD regime until end of 2005
cny <- fxreturns("CNY", frequency = "daily",
  start = as.Date("2005-07-25"), end = as.Date("2005-12-31"),
  other = c("USD", "JPY", "EUR", "GBP"))

## estimate full-sample exchange rate regression model
fm <- fxlm(CNY ~ USD + JPY + EUR + GBP, data = cny)

## check for plain USD peg:
fxpegtest(fm)
## no deviation from a plain USD peg



