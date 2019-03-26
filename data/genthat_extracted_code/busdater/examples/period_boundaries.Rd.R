library(busdater)


### Name: period_boundaries
### Title: Get date's business period boundary (deprecated).
### Aliases: period_boundaries

### ** Examples

# the 1st day of the current financial year
period_boundaries()

# the last day of the current financial year
period_boundaries(boundary = "last day")

# the last day of the last calendar year
period_boundaries(offset_period = -1, bus_period = "CY", boundary = "last day")

# the last day of month 14 months from now
period_boundaries(offset_period = 14, offset_type = "month",
                  bus_period = "M", boundary = "last day")

# The first day of financial years for dates 3 months before the given dates
period_boundaries(as.Date(c("02/27/1992", "09/28/2022"), "%m/%d/%Y"),
                  offset_period = -3, offset_type = "month",
                  bus_period = "FY", boundary = "1st day")




