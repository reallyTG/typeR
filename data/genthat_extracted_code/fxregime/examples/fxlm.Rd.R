library(fxregime)


### Name: fxlm
### Title: Exchange Rate Regression
### Aliases: fxlm coef.fxlm estfun.fxlm bread.fxlm time.fxlm index.fxlm
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

## estimate full-sample exchange rate regression
fm <- fxlm(CNY ~ USD + JPY + EUR + GBP, data = cny)
coef(fm)
summary(fm)

## test parameter stability (with double max test)
scus <- gefp(fm, fit = NULL)
plot(scus, aggregate = FALSE)
## which shows a clear increase in the variance in March 2006

## alternative tests: Andrews' supLM ...
plot(scus, functional = supLM(0.1))
## ... or Nyblom-Hansen test (Cramer-von Mises type test)
plot(scus, functional = meanL2BB)



