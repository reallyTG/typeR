library(adfExplorer)


### Name: rawToAmigaDate
### Title: Convert raw values into a date time object
### Aliases: rawToAmigaDate

### ** Examples

## all raw data is zero, so the origin date is returned:
rawToAmigaDate(raw(12))

## let's get the date, one day, one minute and 50 ticks from the origin:
rawToAmigaDate(amigaIntToRaw(c(1, 1, 50), 32))



