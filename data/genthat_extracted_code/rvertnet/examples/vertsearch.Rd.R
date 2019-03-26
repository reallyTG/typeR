library(rvertnet)


### Name: vertsearch
### Title: Find records using a global full-text search of VertNet
###   archives.
### Aliases: vertsearch

### ** Examples

## Not run: 
##D out <- vertsearch(taxon = "aves", "california", limit=3)
##D 
##D # Limit the number of records returned (under 1000)
##D out <- vertsearch("(kansas state OR KSU)", limit = 200)
##D # Use bigsearch() to retrieve >1000 records
##D 
##D # Find multiple species using searchbyterm():
##D # a) returns a specific result
##D out <- searchbyterm(genus = "mustela", species = "(nivalis OR erminea)")
##D vertmap(out)
##D 
##D # b) returns a non-specific result
##D out <- vertsearch(taxon = "(mustela nivalis OR mustela erminea)")
##D vertmap(out)
##D 
##D # c) returns a non-specific result
##D splist <- c("mustela nivalis", "mustela erminea")
##D out <- lapply(splist, function(x) vertsearch(taxon = x, lim = 500))
##D library("plyr")
##D out <- ldply(lapply(out, "[[", "data"))
##D vertmap(out)
##D 
##D # curl options
##D vertsearch(taxon = "Aves", limit = 10, callopts = list(verbose = TRUE))
##D # vertsearch(taxon = "Aves", limit = 10, callopts = list(timeout_ms = 10))
## End(Not run)



