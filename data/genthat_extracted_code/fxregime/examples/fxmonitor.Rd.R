library(fxregime)


### Name: fxmonitor
### Title: Monitor Exchange Rate Regressions
### Aliases: fxmonitor plot.fxmonitor print.fxmonitor breakpoints.fxmonitor
###   breakdates.fxmonitor
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

## monitor CNY regression as in Shah et al. (2005)
mon <- fxmonitor(CNY ~ USD + JPY + EUR + GBP,
  data = cny, start = as.Date("2005-11-01"))
mon

## visualization
plot(mon)
plot(mon, aggregate = FALSE)
plot(mon, which = "(Variance)")

## query breakpoint/date
breakpoints(mon)
breakdates(mon)



