library(seasonal)


### Name: final
### Title: Time Series of a Seasonal Adjustment Model
### Aliases: final original trend irregular residuals.seas

### ** Examples

## Not run: 
##D 
##D m <- seas(AirPassengers)
##D 
##D final(m)
##D original(m)
##D irregular(m)
##D trend(m)
##D 
##D # NA handling
##D AirPassengersNA <- window(AirPassengers, end = 1962, extend = TRUE)
##D final(seas(AirPassengersNA, na.action = na.omit))    # no NA in final series
##D final(seas(AirPassengersNA, na.action = na.exclude)) # NA in final series
##D final(seas(AirPassengersNA, na.action = na.x13))     # NA filled by x13
##D # final(seas(AirPassengersNA, na.action = na.fail))    # fails
## End(Not run)



