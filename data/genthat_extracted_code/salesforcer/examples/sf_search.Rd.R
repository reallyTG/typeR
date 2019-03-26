library(salesforcer)


### Name: sf_search
### Title: Perform SOSL Search
### Aliases: sf_search

### ** Examples

## Not run: 
##D # free text search
##D area_code_search_string <- "(336)"
##D search_result <- sf_search(area_code_search_string)
##D 
##D # free text search with parameters
##D search_result <- sf_search(area_code_search_string,
##D                            fields_scope = "PHONE",
##D                            objects = "Lead",
##D                            fields = c("id", "phone", "firstname", "lastname"))
##D 
##D # using SOSL
##D my_sosl_search <- paste("FIND {(336)} in phone fields returning",
##D                         "contact(id, phone, firstname, lastname),",
##D                         "lead(id, phone, firstname, lastname)")
##D sosl_search_result <- sf_search(my_sosl_search, is_sosl=TRUE)
## End(Not run)



