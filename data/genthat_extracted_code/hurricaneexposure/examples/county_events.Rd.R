library(hurricaneexposure)


### Name: county_events
### Title: Find events for storms by county
### Aliases: county_events

### ** Examples

# Ensure that data package is available before running the example.
#  If it is not, see the `hurricaneexposure` package vignette for details
# on installing the required data package.
if (requireNamespace("hurricaneexposuredata", quietly = TRUE)) {

county_events(counties = c("37031", "37053", "37055"),
              start_year = 1996, end_year = 2015,
              event_type = "flood")
}



