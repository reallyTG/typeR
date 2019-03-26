library(ALA4R)


### Name: search_names
### Title: Lookup of taxonomic names
### Aliases: search_names

### ** Examples

## Not run: 
##D search_names(c("Grevillea humilis", "Grevillea humilis subsp. maritima",
##D   "Heleioporus", "Thisisnot aname"))
##D 
##D search_names(c("Grevillea humilis", "Grevillea humilis subsp. maritima",
##D   "Heleioporus", "Thisisnot aname"), guids_only=TRUE)
##D 
##D search_names("kookaburra", vernacular=FALSE)
##D 
##D search_names("kookaburra", vernacular=TRUE)
##D 
##D ## occurrence counts for matched names
##D search_names(c("Grevillea humilis", "Grevillea humilis subsp. maritima",
##D   "Heleioporus", "Thisisnot aname"), occurrence_count=TRUE)
##D 
##D ## no occurrence counts because guids_only is TRUE
##D search_names(c("Grevillea humilis", "Grevillea humilis subsp. maritima",
##D   "Heleioporus", "Thisisnot aname"), occurrence_count=TRUE, guids_only=TRUE)
## End(Not run)



