library(MBTAr)


### Name: Theadways
### Title: To get headways and train arrive times for a given
###   station/route/direction in a certain time window.. Returns a list of
###   headways at an origin station during a particular time period on a
###   particular route.
### Aliases: Theadways

### ** Examples

Theadways(from_stop_id = 70007, # Jackson Square Northbound
to_stop_id = 70034, # Malden Southbound
route_id = NULL,
direction_id = 1, # northbound
from_datetime = as.POSIXct("2015-08-03 00:00"),
to_datetime = as.POSIXct("2015-08-03 23:59"),
api_key = "wX9NwuHnZU2ToO7GmGR9uw")
#'




