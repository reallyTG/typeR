library(formattable)


### Name: formattable.POSIXct
### Title: Create a formattable POSIXct vector
### Aliases: formattable.POSIXct

### ** Examples

times <- as.POSIXct("2015-04-10 09:30:15") + 1:5
ftimes <- formattable(times, format = "%Y%m%dT%H%M%S")
ftimes
ftimes + 30



