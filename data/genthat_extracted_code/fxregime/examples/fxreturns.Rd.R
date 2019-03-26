library(fxregime)


### Name: fxreturns
### Title: Compute Exchange Rate Returns
### Aliases: fxreturns
### Keywords: regression

### ** Examples

## load package and data
library("fxregime")
data("FXRatesCHF", package = "fxregime")

## compute returns for CNY (and explanatory currencies)
## for one year after abolishing fixed USD regime
cny <- fxreturns("CNY", frequency = "daily",
  start = as.Date("2005-07-25"), end = as.Date("2006-07-24"),
  other = c("USD", "JPY", "EUR", "GBP"))
plot(cny)



