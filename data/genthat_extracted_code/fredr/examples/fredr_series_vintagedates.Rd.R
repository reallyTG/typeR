library(fredr)


### Name: fredr_series_vintagedates
### Title: Get the data vintage dates for a FRED series
### Aliases: fredr_series_vintagedates

### ** Examples

## No test: 
# All data vintages for the "UNRATE" series
fredr_series_vintagedates(series_id = "UNRATE")
# 10 most recent data vintages for the "UNRATE" series
fredr_series_vintagedates(series_id = "UNRATE", limit = 10L, sort_order = "desc")
## End(No test)



