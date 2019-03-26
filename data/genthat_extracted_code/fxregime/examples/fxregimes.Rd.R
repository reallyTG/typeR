library(fxregime)


### Name: fxregimes
### Title: Dating Breaks Between Exchange Rate Regimes
### Aliases: fxregimes print.fxregimes index.fxregimes time.fxregimes
###   lines.fxregimes coef.fxregimes fitted.fxregimes residuals.fxregimes
###   refit.fxregimes gbreakpoints print.gbreakpoints plot.gbreakpointsfull
###   summary.gbreakpoints logLik.gbreakpoints AIC.gbreakpoints
###   confint.gbreakpoints breakdates.gbreakpoints summary.gbreakpointsfull
###   print.summary.gbreakpointsfull plot.summary.gbreakpointsfull
###   AIC.gbreakpointsfull breakpoints.gbreakpointsfull
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

## compute all segmented regression with minimal segment size of
## h = 20 and maximal number of breaks = 5.
reg <- fxregimes(CNY ~ USD + JPY + EUR + GBP,
  data = cny, h = 20, breaks = 5, ic = "BIC")
summary(reg)

## minimum BIC is attained for 2-segment (1-break) model
plot(reg)

## two regimes
## 1: tight USD peg
## 2: slightly more relaxed USD peg
round(coef(reg), digits = 3)
sqrt(coef(reg)[, "(Variance)"])

## inspect two individual models by re-fitting
refit(reg)



