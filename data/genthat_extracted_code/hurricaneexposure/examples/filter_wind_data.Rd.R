library(hurricaneexposure)


### Name: filter_wind_data
### Title: Filter hurricane wind dataset
### Aliases: filter_wind_data

### ** Examples

# Ensure that data package is available before running the example.
#  If it is not, see the `hurricaneexposure` package vignette for details
# on installing the required data package.
if (requireNamespace("hurricaneexposuredata", quietly = TRUE)) {

filter_wind_data(counties = c("22071", "51700"), year_range = c(1988, 2011),
                 wind_limit = 20,
                 output_vars = c("fips", "storm_id", "vmax_sust"))
}



