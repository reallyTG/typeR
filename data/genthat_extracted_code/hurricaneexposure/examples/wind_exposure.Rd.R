library(hurricaneexposure)


### Name: wind_exposure
### Title: Write storm wind exposure files
### Aliases: wind_exposure

### ** Examples

## Not run: 
##D # Ensure that data package is available before running the example.
##D #  If it is not, see the `hurricaneexposure` package vignette for details
##D # on installing the required data package.
##D if (requireNamespace("hurricaneexposuredata", quietly = TRUE)) {
##D 
##D # By county
##D wind_exposure(locations = c("22071", "51700"),
##D               start_year = 1988, end_year = 2005,
##D               wind_limit = 10,
##D               out_dir = "~/tmp/storms")
##D 
##D # For multi-county communities
##D communities <- data.frame(commun = c(rep("ny", 6), "no", "new"),
##D                           fips = c("36005", "36047", "36061",
##D                           "36085", "36081", "36119",
##D                           "22071", "51700"))
##D wind_exposure(locations = communities,
##D               start_year = 1988, end_year = 2005,
##D               wind_limit = 10,
##D               out_dir = "~/tmp/storms")
##D }
## End(Not run)



