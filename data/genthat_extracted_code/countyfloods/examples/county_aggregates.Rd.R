library(countyfloods)


### Name: county_aggregates
### Title: Get county level output
### Aliases: county_aggregates

### ** Examples

## Not run: 
##D va_counties <- get_county_cd("Virginia")
##D va_gages <- get_gages(va_counties, start_date = "2015-01-01",
##D                       end_date = "2015-12-31")
##D va_flow_data <- get_flow_data(va_gages, start_date = "2015-01-01",
##D                       end_date = "2015-12-31")
##D va_peaks <- find_q2(va_gages$site_no)
##D va_stats <- flood_analysis(flow_data = va_flow_data, peaks = va_peaks,
##D                        gages = va_gages, county_cd = va_counties, threshold = "Q2")
##D va_county_stats <- county_aggregates(flood_stats = va_stats)
## End(Not run)



