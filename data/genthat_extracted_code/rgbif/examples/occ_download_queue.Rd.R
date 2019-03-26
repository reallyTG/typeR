library(rgbif)


### Name: occ_download_queue
### Title: Download requests in a queue
### Aliases: occ_download_queue

### ** Examples

## Not run: 
##D # passing occ_download() requests via ...
##D out <- occ_download_queue(
##D   occ_download('taxonKey = 3119195', "year = 1976"),
##D   occ_download('taxonKey = 3119195', "year = 2001"),
##D   occ_download('taxonKey = 3119195', "year = 2001", "month <= 8"),
##D   occ_download('taxonKey = 5229208', "year = 2011"),
##D   occ_download('taxonKey = 2480946', "year = 2015"),
##D   occ_download("country = NZ", "year = 1999", "month = 3"),
##D   occ_download("catalogNumber = Bird.27847588", "year = 1998", "month = 2")
##D )
##D 
##D # supports <= 3 requests too
##D out <- occ_download_queue(
##D   occ_download("country = NZ", "year = 1999", "month = 3"),
##D   occ_download("catalogNumber = Bird.27847588", "year = 1998", "month = 2")
##D )
##D 
##D # using pre-prepared requests via .list
##D keys <- c(7905507, 5384395, 8911082)
##D queries <- list()
##D for (i in seq_along(keys)) {
##D   queries[[i]] <- occ_download_prep(
##D     paste0("taxonKey = ", keys[i]),
##D     "basisOfRecord = HUMAN_OBSERVATION,OBSERVATION",
##D     "hasCoordinate = true",
##D     "hasGeospatialIssue = false",
##D     "year = 1993"
##D   )
##D }
##D out <- occ_download_queue(.list = queries)
##D out
##D 
##D # another pre-prepared example
##D yrs <- 1930:1934
##D length(yrs)
##D queries <- list()
##D for (i in seq_along(yrs)) {
##D   queries[[i]] <- occ_download_prep(
##D     "taxonKey = 2877951",
##D     "basisOfRecord = HUMAN_OBSERVATION,OBSERVATION",
##D     "hasCoordinate = true",
##D     "hasGeospatialIssue = false",
##D     paste0("year = ", yrs[i])
##D   )
##D }
##D out <- occ_download_queue(.list = queries)
##D out
## End(Not run)



