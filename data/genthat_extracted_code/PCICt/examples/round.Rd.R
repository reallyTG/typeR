library(PCICt)


### Name: round.PCICt
### Title: round.PCICt
### Aliases: round.PCICt

### ** Examples

## Convert strings to PCICt objects, on a 360 day calendar
x <- as.PCICt(c("1961-02-30 12:00:00", "1962-03-24 12:34:56"), cal="360")

## Round them to the nearest hour
x.hour <- round(x, "hours")

## Round them to the nearest day
x.day <- round(x, "days")



