library(XBRL)


### Name: xbrlDoAll
### Title: Function to do all required work on an XBRL instance and its
###   associated DTS.
### Aliases: xbrlDoAll
### Keywords: XBRL high-level

### ** Examples

## Not run: 
##D ## Setting stringsAsFactors = FALSE is highly recommended
##D ## to avoid data frames to create factors from character vectors.
##D options(stringsAsFactors = FALSE)
##D 
##D ## XBRL instance file to be analyzed, accessed
##D ## directly from SEC website:
##D inst <- "https://www.sec.gov/Archives/edgar/data/21344/000002134413000050/ko-20130927.xml"
##D 
##D xbrl.vars <- xbrlDoAll(inst, cache.dir="XBRLcache", prefix.out="out", verbose=TRUE)
## End(Not run)



