library(hurricaneexposure)


### Name: map_wind_exposure
### Title: Map counties with wind exposure
### Aliases: map_wind_exposure

### ** Examples

# Ensure that data package is available before running the example.
#  If it is not, see the `hurricaneexposure` package vignette for details
# on installing the required data package.
if (requireNamespace("hurricaneexposuredata", quietly = TRUE)) {

map_wind_exposure(storm = "Beryl-1988", wind_limit = 15)
}



