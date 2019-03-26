library(creditr)


### Name: rates
### Title: LIBOR rates from 2004-01-01 to 2015-08-03
### Aliases: rates
### Keywords: datasets, interest rates

### ** Examples

data(rates)

## for JPY rates:
rates[rates$currency == "JPY",]

## for rates on a specific date, of a specific currency:
rates[rates$currency == "USD" & rates$date == "2005-10-01",]



