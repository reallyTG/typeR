library(rclimateca)


### Name: ec_climate_data_base
### Title: Low-level access to the EC Climate Bulk Data Service
### Aliases: ec_climate_data_base

### ** Examples

## No test: 
# station 27141 is Kentville CDA CS
monthly <- ec_climate_data_base(27141, timeframe = "monthly")
daily <- ec_climate_data_base(27141, timeframe = "daily", year = 1999)
hourly <- ec_climate_data_base(27141, timeframe = "hourly", year = 1999, month = 7)
## End(No test)




