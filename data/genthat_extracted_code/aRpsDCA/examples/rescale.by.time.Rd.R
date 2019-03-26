library(aRpsDCA)


### Name: rescale.by.time
### Title: Time unit conversion for DCA
### Aliases: rescale.by.time

### ** Examples

## 3 MMscf/D to MMscf/year
rescale.by.time(3, from.period="day", to.period="year", method="rate")

## Nominal decline of 3.2/year to nominal decline per month
rescale.by.time(3.2, from.period="year", to.period="month", method="decline")

## 5 years in days
rescale.by.time(5, from.period="year", to.period="month", method="time")



