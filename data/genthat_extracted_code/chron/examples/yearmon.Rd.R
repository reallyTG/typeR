library(chron)


### Name: yearmon
### Title: Convert monthly or quarterly data to chron
### Aliases: as.chron.yearmon as.chron.yearqtr as.chron.ts
### Keywords: ts

### ** Examples

## Monthly time series data.
as.chron(AirPassengers)
as.chron(time(AirPassengers))
## convert to first day of the month that is not a weekend or holiday
as.chron(AirPassengers, frac = 0, holidays = TRUE)
## convert to last day of the month
as.chron(AirPassengers, frac = 1)
## convert to last day of the month that is not a weekend or holiday
as.chron(AirPassengers, frac = 1, holidays = TRUE)
## convert to last weekday of the month
as.chron(AirPassengers, frac = 1, holidays = c())

## Quarterly time series data.
as.chron(presidents)
as.chron(time(presidents))



