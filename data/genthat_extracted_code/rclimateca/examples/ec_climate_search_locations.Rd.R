library(rclimateca)


### Name: ec_climate_search_locations
### Title: Search climate locations
### Aliases: ec_climate_search_locations ec_climate_geosearch_locations

### ** Examples


# character searches match the location column of ec_climate_locations_all
# (case-insensitive)
ec_climate_search_locations("ottawa")

# multiple values use OR logic
ec_climate_search_locations(c("ottawa on", "halifax"))

# you can use a year and a timeframe to find locations that are known to have some
# data for that year/timeframe
ec_climate_search_locations("ottawa", year = 2016)
ec_climate_search_locations("ottawa", timeframe = "daily", year = 2016)

# you can also use a vector of years
ec_climate_search_locations("ottawa", timeframe = "daily", year = 2000:2016)

# if you need to search geographically, you can pass a numeric vector in the form
# c(lon, lat)
ec_climate_search_locations(c(-75.69031, 45.42111))

## No test: 
# to use a human readable geocoded location, use ec_climate_geosearch_locations()
ec_climate_geosearch_locations("ottawa on")
## End(No test)




