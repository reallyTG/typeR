library(hurricaneexposure)


### Name: multi_county_rain
### Title: Hurricane exposure by rain for communities
### Aliases: multi_county_rain

### ** Examples

# Ensure that data package is available before running the example.
#  If it is not, see the `hurricaneexposure` package vignette for details
# on installing the required data package.
if (requireNamespace("hurricaneexposuredata", quietly = TRUE)) {

communities <- data.frame(commun = c(rep("ny", 6), "no", "new"),
                         fips = c("36005", "36047", "36061",
                                  "36085", "36081", "36119",
                                  "22071", "51700"))
rain_storm_df <- multi_county_rain(communities = communities,
                                   start_year = 1995, end_year = 2005,
                                   rain_limit = 100, dist_limit = 100)
}



