library(rscopus)


### Name: generic_elsevier_api
### Title: Generic Elsevier Search
### Aliases: generic_elsevier_api

### ** Examples

## Not run: 
##D query_string = "affil(hopkins)"
##D # Use affiliation query
##D s = generic_elsevier_api(query = query_string,
##D                          type = "search", search_type = "affiliation",
##D                          api_key = api_key,
##D                       verbose = FALSE)
##D 
##D # Use author query
##D s = generic_elsevier_api(query = query_string,
##D type = "search", search_type = "author",
##D api_key = api_key,
##D                       verbose = FALSE)
##D 
##D # Query abstract by pii
##D s = generic_elsevier_api(query = "",
##D                       type = "abstract", http_end = "pii/S1053811915002700",
##D                       api_key = api_key,
##D                       verbose = FALSE)
## End(Not run)



