library(rgbif)


### Name: GbifQueue
### Title: GBIF download queue
### Aliases: GbifQueue
### Keywords: internal

### ** Examples

## Not run: 
##D x <- GbifQueue$new(
##D   occ_download('taxonKey = 3119195', "year = 1976"),
##D   occ_download('taxonKey = 3119195', "year = 2001"),
##D   occ_download('taxonKey = 3119195', "year = 2001", "month <= 8"),
##D   occ_download('taxonKey = 3119195', "year = 2004"),
##D   occ_download('taxonKey = 3119195', "year = 2005")
##D )
##D que = x
##D x
##D x$reqs
##D x$add_all()
##D x$jobs()
##D x
##D x$remove(x$reqs[[1]])
##D x
##D 
##D # pre-prepared download request
##D z <- occ_download_prep(
##D   "basisOfRecord = HUMAN_OBSERVATION,OBSERVATION",
##D   "hasCoordinate = true",
##D   "hasGeospatialIssue = false",
##D   "year = 1993",
##D   user = "foo", pwd = "bar", email = "foo@bar.com"
##D )
##D out <- GbifQueue$new(.list = list(z))
##D out
##D out$reqs
## End(Not run)



