library(chron)


### Name: days
### Title: Return Various Periods from a Chron or Dates Object
### Aliases: days months.default quarters.default weekdays.default years
### Keywords: chron

### ** Examples

dts <- dates("07/01/78") + trunc(50 * rnorm(30))
plot(weekdays(dts))
plot(months(dts))

## The day in the current timezone as a Date object.
Dt <- Sys.Date()
## Using the months method for Date objects.
months(Dt)
## Using the months default method.
months(as.chron(Dt))



