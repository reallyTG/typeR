library(mregions)


### Name: mr_names_search
### Title: Search for region names
### Aliases: mr_names_search

### ** Examples

## Not run: 
##D # Get region names with mr_names() function
##D (res <- mr_names("MarineRegions:eez"))
##D 
##D # to save time, pass in the result from mr_names()
##D mr_names_search(res, q = "Amer")
##D 
##D # if you don't pass in the result from mr_names(), we have to
##D # call mr_names() internally, adding some time
##D mr_names_search(x = "iho", q = "Black")
##D mr_names_search(x = "iho", q = "Sea")
##D 
##D # more examples
##D mr_names_search("iho", "Sea")
##D (res <- mr_names("MarineRegions:iho"))
##D mr_names_search(res, q = "Sea")
## End(Not run)



