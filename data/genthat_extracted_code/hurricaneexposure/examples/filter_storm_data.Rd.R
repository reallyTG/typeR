library(hurricaneexposure)


### Name: filter_storm_data
### Title: Filter hurricane datasets
### Aliases: filter_storm_data

### ** Examples

# Ensure that data package is available before running the example.
#  If it is not, see the `hurricaneexposure` package vignette for details
# on installing the required data package.
if (requireNamespace("hurricaneexposuredata", quietly = TRUE)) {

filter_storm_data(counties = c("22071", "51700"), year_range = c(1988, 2011),
                  distance_limit = 250, rain_limit = 150,
                 include_rain = TRUE, days_included = c(-1, 0, 1),
                 output_vars = c("fips", "storm_id", "closest_date",
                                 "storm_dist", "tot_precip"))
filter_storm_data(storm = "Floyd-1999", include_rain = TRUE,
                 days_included = c(-1, 0, 1),
                 output_vars = c("fips", "tot_precip"))
}



