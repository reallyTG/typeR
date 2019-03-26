library(rMEA)


### Name: timeMaster
### Title: Transform time values between different formats
### Aliases: timeMaster

### ** Examples

## Adding seconds to minutes
timeMaster(30, add="10:00", out = "min")

## Adding strings to integer seconds and returning a numeric value
timeMaster(30, add="10:00")

## Automatic detection of format
timeMaster("01:30:55",add="10:00",out = "auto")



