library(adfExplorer)


### Name: amigaDateToRaw
### Title: Convert date time objects into raw values
### Aliases: amigaDateToRaw

### ** Examples

## Note that using the same date-time with different timezones will
## result in different raw data. The time zone is not stored.
amigaDateToRaw(as.POSIXct("1978-01-01 13:30", tz = "UTC"))
amigaDateToRaw(as.POSIXct("1978-01-01 13:30", tz = "CET"))



