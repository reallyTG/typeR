library(hurricaneexposure)


### Name: county_distance
### Title: Hurricane exposure by distance for counties
### Aliases: county_distance

### ** Examples

# Ensure that data package is available before running the example.
#  If it is not, see the `hurricaneexposure` package vignette for details
# on installing the required data package.
if (requireNamespace("hurricaneexposuredata", quietly = TRUE)) {

  county_distance(counties = c("22071", "51700"),
              start_year = 1995, end_year = 2005,
              dist_limit = 75)

}



