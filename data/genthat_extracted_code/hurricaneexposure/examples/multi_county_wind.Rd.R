library(hurricaneexposure)


### Name: multi_county_wind
### Title: Hurricane exposure by wind for communities
### Aliases: multi_county_wind

### ** Examples

# Ensure that data package is available before running the example.
#  If it is not, see the `hurricaneexposure` package vignette for details
# on installing the required data package.
if (requireNamespace("hurricaneexposuredata", quietly = TRUE)) {

communities <- data.frame(commun = c(rep("ny", 6), "no", "new"),
                         fips = c("36005", "36047", "36061",
                                  "36085", "36081", "36119",
                                  "22071", "51700"))
wind_df <- multi_county_wind(communities = communities,
                                     start_year = 1988, end_year = 2005,
                                     wind_limit = 20)
}



