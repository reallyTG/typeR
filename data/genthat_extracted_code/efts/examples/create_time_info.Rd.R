library(efts)


### Name: create_time_info
### Title: Helper function to create the definition of the time dimension
###   for use in a netCDF file
### Aliases: create_time_info

### ** Examples

timeAxisStart <- ISOdate(2015, 10, 4, 0, 0, 0, tz = "Australia/Canberra")
(time_dim_info <- create_time_info(from = timeAxisStart, n = 24L, 
  time_step = "hours since", time_step_delta = 3L, tzoffset = "+1000"))

# Note that the time zone information of thes sart date is NOT 
# used by create_time_info; the tzoffset argument takes precedence 
timeAxisStart <- ISOdate(2015, 10, 4, 0, 0, 0, tz = "Australia/Perth")
(time_dim_info <- create_time_info(from = timeAxisStart, n = 24L, 
  time_step = "hours since", time_step_delta = 3L, tzoffset = "+1000"))




