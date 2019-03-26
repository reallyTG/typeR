library(hurricaneexposure)


### Name: county_rain
### Title: Hurricane exposure by rain for counties
### Aliases: county_rain

### ** Examples

# Ensure that data package is available before running the example.
#  If it is not, see the `hurricaneexposure` package vignette for details
# on installing the required data package.
if (requireNamespace("hurricaneexposuredata", quietly = TRUE)) {

county_rain(counties = c("22071", "51700"),
            start_year = 1995, end_year = 2005,
            rain_limit = 100, dist_limit = 100)
}



