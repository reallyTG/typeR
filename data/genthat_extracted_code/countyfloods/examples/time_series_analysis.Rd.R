library(countyfloods)


### Name: time_series_analysis
### Title: Get time series output
### Aliases: time_series_analysis

### ** Examples

## Not run: 
##D va_counties <- get_county_cd("Virginia")
##D va_gages <- get_gages(va_counties, start_date = "2015-01-01",
##D                       end_date = "2015-12-31")
##D va_flow_data <- get_flow_data(va_gages, start_date = "2015-01-01",
##D                       end_date = "2015-12-31")
##D va_peaks <- find_q2(va_gages$site_no)
##D va_time_series <- time_series_analysis(flow_data = va_flow_data, peaks = va_peaks,
##D                         gages = va_gages, county_cd = va_counties,
##D                         q2_val = dplyr::rename_(va_peaks, .dots = list(q2 = "flood_val")),
##D                         threshold = "Q2")
## End(Not run)



