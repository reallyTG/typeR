library(taxize)


### Name: get_uid
### Title: Get the UID codes from NCBI for taxonomic names.
### Aliases: get_uid as.uid as.uid.uid as.uid.character as.uid.list
###   as.uid.numeric as.uid.data.frame as.data.frame.uid get_uid_

### ** Examples

## Not run: 
##D get_uid(c("Chironomus riparius", "Chaetopteryx"))
##D get_uid(c("Chironomus riparius", "aaa vva"))
##D 
##D # When not found
##D get_uid("howdy")
##D get_uid(c("Chironomus riparius", "howdy"))
##D 
##D # Narrow down results to a division or rank, or both
##D ## By modifying the query
##D ### w/ modifiers to the name
##D get_uid(sciname = "Aratinga acuticauda", modifier = "Organism")
##D get_uid(sciname = "bear", modifier = "Common Name")
##D 
##D ### w/ rank query
##D get_uid(sciname = "Pinus", rank_query = "genus")
##D get_uid(sciname = "Pinus", rank_query = "subgenus")
##D ### division query doesn't really work, for unknown reasons, so not available
##D 
##D ## By filtering the result
##D ## Echinacea example
##D ### Results w/o narrowing
##D get_uid("Echinacea")
##D ### w/ division
##D get_uid(sciname = "Echinacea", division_filter = "eudicots")
##D get_uid(sciname = "Echinacea", division_filter = "sea urchins")
##D 
##D ## Satyrium example
##D ### Results w/o narrowing
##D get_uid(sciname = "Satyrium")
##D ### w/ division
##D get_uid(sciname = "Satyrium", division_filter = "monocots")
##D get_uid(sciname = "Satyrium", division_filter = "butterflies")
##D 
##D ## Rank example
##D get_uid(sciname = "Pinus")
##D get_uid(sciname = "Pinus", rank_filter = "genus")
##D get_uid(sciname = "Pinus", rank_filter = "subgenus")
##D 
##D # Fuzzy filter on any filtering fields
##D ## uses grep on the inside
##D get_uid("Satyrium", division_filter = "m")
##D 
##D # specify rows to limit choices available
##D get_uid('Dugesia') # user prompt needed
##D get_uid('Dugesia', rows=1) # 2 choices, so returns only 1 row, so no choices
##D get_uid('Dugesia', ask = FALSE) # returns NA for multiple matches
##D 
##D # Go to a website with more info on the taxon
##D res <- get_uid("Chironomus riparius")
##D browseURL(attr(res, "uri"))
##D 
##D # Convert a uid without class information to a uid class
##D as.uid(get_uid("Chironomus riparius")) # already a uid, returns the same
##D as.uid(get_uid(c("Chironomus riparius","Pinus contorta"))) # same
##D as.uid(315567) # numeric
##D as.uid(c(315567,3339,9696)) # numeric vector, length > 1
##D as.uid("315567") # character
##D as.uid(c("315567","3339","9696")) # character vector, length > 1
##D as.uid(list("315567","3339","9696")) # list, either numeric or character
##D ## dont check, much faster
##D as.uid("315567", check=FALSE)
##D as.uid(315567, check=FALSE)
##D as.uid(c("315567","3339","9696"), check=FALSE)
##D as.uid(list("315567","3339","9696"), check=FALSE)
##D 
##D (out <- as.uid(c(315567,3339,9696)))
##D data.frame(out)
##D as.uid( data.frame(out) )
##D 
##D # Get all data back
##D get_uid_("Puma concolor")
##D get_uid_("Dugesia")
##D get_uid_("Dugesia", rows=2)
##D get_uid_("Dugesia", rows=1:2)
##D get_uid_(c("asdfadfasd","Pinus contorta"))
##D 
##D # use curl options
##D get_uid("Quercus douglasii", verbose = TRUE)
## End(Not run)



