library(RApiDatetime)


### Name: asDatePOSIXct
### Title: Conversion from POSIXct to Date
### Aliases: asDatePOSIXct

### ** Examples

p <- .POSIXct(1540181413, "America/Chicago")
as.Date(p)                     # Using UTC timezone
as.Date(p, "America/Chicago")  # Using local timezone
asDatePOSIXct(p)               # Direct, using local timezone



