library(isdparser)


### Name: isd_parse
### Title: Parse NOAA ISD/ISH data files
### Aliases: isd_parse

### ** Examples

path <- system.file('extdata/104270-99999-1928.gz', package = "isdparser")

(res <- isd_parse(path))

# with progress
(res2 <- isd_parse(path, progress = TRUE))

# only control + mandatory sections
(res <- isd_parse(path, additional = FALSE))

## Not run: 
##D # in parallel
##D (out <- isd_parse(path, parallel = TRUE))
## End(Not run)



