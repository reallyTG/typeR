library(salesforcer)


### Name: parameterized_search_control
### Title: Auxiliary for Controlling Parametrized Searches
### Aliases: parameterized_search_control

### ** Examples

## Not run: 
##D # free text search only on Contact record Phone fields
##D # this will improve the performance of the search
##D my_phone_search <- "(336)"
##D search_result <- sf_search(my_phone_search,
##D                            objects = c("Contact", "Lead"),
##D                            fields_scope = "PHONE",
##D                            fields = c("Id", "FirstName", "LastName"))
## End(Not run)



