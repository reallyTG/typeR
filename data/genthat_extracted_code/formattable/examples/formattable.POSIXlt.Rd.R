library(formattable)


### Name: formattable.POSIXlt
### Title: Create a formattable POSIXlt vector
### Aliases: formattable.POSIXlt

### ** Examples

times <- as.POSIXlt("2015-04-10 09:30:15") + 1:5
ftimes <- formattable(times, format = "%Y%m%dT%H%M%S")
ftimes
ftimes + 30



