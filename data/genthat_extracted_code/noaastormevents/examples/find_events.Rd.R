library(noaastormevents)


### Name: find_events
### Title: Find all event listings for date range
### Aliases: find_events

### ** Examples

## Not run: 
##D # Events by date range
##D find_events(date_range = c("1999-09-10", "1999-09-30"))
##D 
##D # Events within a certain distance and time range of a tropical storm
##D find_events(storm = "Floyd-1999", dist_limit = 200)
##D 
##D # Limit output to events that are floods or flash floods
##D find_events(storm = "Floyd-1999", dist_limit = 200, event_types = c("Flood", "Flash Flood"))
## End(Not run)




