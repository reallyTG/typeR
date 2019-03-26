library(flux)


### Name: round.POSIXlt
### Title: Round times.
### Aliases: round.POSIXlt round.POSIXct
### Keywords: manip

### ** Examples

# Current time in GMT and as class "POSIXlt"
zlt <- as.POSIXlt(Sys.time(), "GMT") 

# Same time as class POSIXct
zct <- as.POSIXct(zlt)

# round to minute
round(zct)

# round to half hour
round(zct, "30mins")
round(zct, "half hour")
round(zct, 30)

# round to 20 minutes
round(zlt, 20)

# round to 30 seconds
round(zlt, 0.5)



