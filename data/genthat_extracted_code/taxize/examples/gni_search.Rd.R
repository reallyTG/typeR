library(taxize)


### Name: gni_search
### Title: Search for taxonomic names using the Global Names Index.
### Aliases: gni_search
### Keywords: globalnamesindex names taxonomy

### ** Examples

## Not run: 
##D gni_search(search_term = "ani*")
##D gni_search(search_term = "ama*", per_page = 3, page = 21)
##D gni_search(search_term = "animalia", per_page = 8, page = 1)
##D gni_search(search_term = "animalia", per_page = 8, page = 1, justtotal=TRUE)
##D 
##D gni_search(search_term = "Cyanistes caeruleus", parse_names=TRUE)
##D 
##D # pass on curl options to httr
##D library("httr")
##D gni_search(search_term = "ani*", config = verbose())
## End(Not run)



