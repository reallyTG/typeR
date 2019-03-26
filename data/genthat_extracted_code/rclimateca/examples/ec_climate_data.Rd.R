library(rclimateca)


### Name: ec_climate_data
### Title: Load Environment Canada Historical Climate Data
### Aliases: ec_climate_data ec_climate_mudata

### ** Examples

## No test: 
# station 27141 is Kentville CDA CS
monthly <- ec_climate_data(27141, timeframe = "monthly")
daily <- ec_climate_data(27141, timeframe = "daily", start = "1999-01-01", end = "1999-12-31")
hourly <- ec_climate_data(27141, timeframe = "hourly", start = "1999-07-01", end = "1999-07-31")

# get climate data in mudata format
library(mudata2)
monthly_md <- ec_climate_mudata(27141, timeframe = "monthly")
daily_md <- ec_climate_mudata(27141, timeframe = "daily",
                              start = "1999-01-01", end = "1999-12-31")
hourly_md <- ec_climate_mudata(27141, timeframe = "hourly",
                               start = "1999-07-01", end = "1999-07-31")

# mudata objects can easily be plotted
autoplot(monthly_md)
autoplot(daily_md)
autoplot(hourly_md)
## End(No test)




