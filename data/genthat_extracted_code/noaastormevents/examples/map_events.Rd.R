library(noaastormevents)


### Name: map_events
### Title: Map storm events for a date range
### Aliases: map_events

### ** Examples

## Not run: 
##D # Map for events pulled by a date range
##D event_data <- find_events(date_range = c("1999-09-10", "1999-09-30"))
##D map_events(event_data)
##D map_events(event_data, plot_type = "number of events")
##D 
##D # Map for a specific type of event
##D event_data <- find_events(date_range = c("1999-09-10", "1999-09-30"),
##D                           event_types = c("Flood","Flash Flood"))
##D map_events(event_data, states = "north carolina", plot_type = "number of events")
##D map_events(event_data, states = "all")
##D 
##D # Map for events identified based on a hurricane storm track
##D event_data <- find_events(storm = "Floyd-1999", dist_limit = 300)
##D map_events(event_data, plot_type = "number of events",
##D            storm = "Floyd-1999", add_tracks = TRUE)
##D map_events(event_data, plot_type = "crop damage",
##D            storm = "Floyd-1999", add_tracks = TRUE,
##D            states = c("north carolina", "virginia", "maryland"))
##D map_events(event_data, plot_type = "property damage",
##D            storm = "Floyd-1999", add_tracks = TRUE)
##D map_events(event_data, plot_type = "direct deaths")
##D 
##D event_data <- find_events(date_range = c("1999-01-01", "1999-12-31"))
##D map_events(event_data, plot_type = "direct deaths")
##D map_events(event_data, plot_type = "indirect deaths")
##D map_events(event_data, plot_type = "direct injuries")
##D map_events(event_data, plot_type = "indirect injuries")
##D map_events(event_data, plot_type = "crop damage")
## End(Not run)




