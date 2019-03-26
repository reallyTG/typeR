library(atsd)


### Name: query
### Title: Fetch time-series historic data or forecasts from Axibase
###   Time-Series Database.
### Aliases: query

### ** Examples

## Not run: 
##D # Create data frame which contains time series for the given metric 
##D # and all entities for the last 1 hour.
##D dfr <- query(metric = "disk_used_percent", selection_interval = "1-Hour")
##D 
##D dfr <- query( export_type = "Forecast",
##D               metric = "disk_used_percent",
##D               entity_group = "Linux",
##D               tags = c("mount_point=/boot", "file_system=/dev/sda1"),
##D               selection_interval = "1-Week",
##D               aggregate_statistics = c("Avg", "Min", "Max"),
##D               aggregate_interval = "1-Minute",
##D               interpolation = "Linear")
##D                
##D # Example of the end_time argument usage.
##D dfr <- query( metric = "cpu_usage",
##D               entity = "host-383",
##D               selection_interval = "1-Day",
##D               end_time = "date('2015-02-10 10:15:03')")
## End(Not run)



