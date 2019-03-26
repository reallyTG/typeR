library(rmapzen)


### Name: mz_autocomplete
### Title: Mapzen search API
### Aliases: mz_autocomplete mz_reverse_geocode search mz_search

### ** Examples

## Not run: 
##D # hard rock cafes in sweden:
##D mz_search("Hard Rock Cafe", boundary.country = "SE")
##D 
##D # autocompletions when the user types in "Union Square"
##D # prioritizing San Francisco results first:
##D mz_autocomplete("Union Square",
##D                 focus.point = mz_geocode("San Francisco, CA"))
## End(Not run)




