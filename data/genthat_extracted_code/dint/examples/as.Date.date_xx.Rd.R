library(dint)


### Name: as.Date.date_xx
### Title: Coerce dint Objects to Base R Date Types
### Aliases: as.Date.date_xx as.POSIXlt.date_xx as.POSIXct.date_xx
###   Sys.date_yq Sys.date_ym Sys.date_yw as.Date.date_y as.Date.date_ym
###   as.Date.date_yq as.Date.date_yw

### ** Examples

as.Date(date_yq(2017, 2))
as.POSIXlt(date_yq(2017, 2))

# When coercing to datetime, the default timezone is UTC
as.POSIXct(date_yq(2017, 2))




