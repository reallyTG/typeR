library(countyfloods)


### Name: time_series_plot
### Title: Function plots time series data by county
### Aliases: time_series_plot

### ** Examples

## Not run: 
##D #Use Q2 as flood threshold
##D va_time_series <- time_series_flood(state = "Virginia", start_date = "2015-01-01",
##D                       end_date = "2015-12-31", threshold = "Q2")
##D 
##D #Map results
##D time_series_plot(va_time_series[[2]])
## End(Not run)




