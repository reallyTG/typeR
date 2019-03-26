library(hurricaneexposure)


### Name: county_wind
### Title: Hurricane exposure by wind for counties
### Aliases: county_wind

### ** Examples

# Ensure that data package is available before running the example.
#  If it is not, see the `hurricaneexposure` package vignette for details
# on installing the required data package.
if (requireNamespace("hurricaneexposuredata", quietly = TRUE)) {

county_wind(counties = c("22071", "51700"),
            start_year = 1988, end_year = 2005,
            wind_limit = 20, wind_var = "vmax_sust")
}



