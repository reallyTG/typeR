library(hurricaneexposure)


### Name: map_counties
### Title: Map counties
### Aliases: map_counties

### ** Examples

# Ensure that data package is available before running the example.
#  If it is not, see the `hurricaneexposure` package vignette for details
# on installing the required data package.
if (requireNamespace("hurricaneexposuredata", quietly = TRUE)) {

map_counties("Floyd-1999", metric = "rainfall", days_included = c(-2, -1, 0, 1))

map_counties("Katrina-2005", metric = "wind")
map_counties("Katrina-2005", metric = "wind", wind_var = "vmax_gust")
map_counties("Katrina-2005", metric = "wind", wind_var = "sust_dur")
map_counties("Katrina-2005", metric = "wind", wind_source = "ext_tracks")
}



