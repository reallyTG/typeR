library(wql)


### Name: seaKen
### Title: Seasonal and Regional Kendall trend test
### Aliases: seaKen
### Keywords: ts

### ** Examples


# Seasonal Kendall test:
chl <- sfbayChla # monthly chlorophyll at 16 stations in San Francisco Bay
seaKen(sfbayChla[, 's27']) # results for a single series at station 27
seaKen(sfbayChla) # results for all stations
seaKen(sfbayChla, plot=TRUE, type="relative", order=TRUE)

# Regional Kendall test:
# Use mts2ts to change 16 series into a single series with 16 "seasons"
seaKen(mts2ts(chl))  # too many missing data
# better when just Feb-Apr, spring bloom period,
# but last 4 stations still missing too much.
seaKen(mts2ts(chl, seas = 2:4)) 
seaKen(mts2ts(chl[, 1:12], 2:4)) # more reliable result




