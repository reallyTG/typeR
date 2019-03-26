library(PMwR)


### Name: unit_prices
### Title: Compute Prices for Portfolio Based on Units
### Aliases: unit_prices

### ** Examples

NAV <- data.frame(timestamp = seq(as.Date("2017-1-1"),
                                  as.Date("2017-1-10"),
                                  by = "1 day"),
                  NAV = c(0,101:104,205:209))

cf <- data.frame(timestamp = c(as.Date("2017-1-1"),
                               as.Date("2017-1-5")),
                 cashflow = c(100, 100))

unit_prices(NAV, cf)




