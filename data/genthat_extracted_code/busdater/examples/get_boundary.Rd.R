library(busdater)


### Name: get_boundary
### Title: Get date's business period boundary.
### Aliases: get_boundary

### ** Examples

# the 1st day of the current financial year
get_boundary()

# the last day of the current financial year
get_boundary(boundary = "last day")

# the last day of the last calendar year
get_boundary(offset_period = -1, bus_period = "CY", boundary = "last day")

# the last day of month 14 months from now
get_boundary(offset_period = 14, offset_type = "month",
                  bus_period = "M", boundary = "last day")

# The first day of financial years for dates 3 months before the given dates
get_boundary(as.Date(c("02/27/1992", "09/28/2022"), "%m/%d/%Y"),
                  offset_period = -3, offset_type = "month",
                  bus_period = "FY", boundary = "1st day")




