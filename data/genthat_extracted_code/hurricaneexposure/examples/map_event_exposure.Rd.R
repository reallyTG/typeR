library(hurricaneexposure)


### Name: map_event_exposure
### Title: Map county-level exposure based on reported events
### Aliases: map_event_exposure

### ** Examples

# Ensure that data package is available before running the example.
#  If it is not, see the `hurricaneexposure` package vignette for details
# on installing the required data package.
if (requireNamespace("hurricaneexposuredata", quietly = TRUE)) {

map_event_exposure(storm_id = "Floyd-1999", event_type = "flood")
map_event_exposure(storm_id = "Floyd-1999", event_type = "tornado")
map_event_exposure(storm_id = "Floyd-1999", event_type = "wind")
map_event_exposure(storm_id = "Floyd-1999", event_type = "tropical_storm")
}



