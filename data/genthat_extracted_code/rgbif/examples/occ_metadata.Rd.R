library(rgbif)


### Name: occ_metadata
### Title: Search for catalog numbers, collection codes, collector names,
###   and institution codes.
### Aliases: occ_metadata

### ** Examples

## Not run: 
##D # catalog number
##D occ_metadata(type = "catalogNumber", q=122)
##D 
##D # collection code
##D occ_metadata(type = "collectionCode", q=12)
##D 
##D # institution code
##D occ_metadata(type = "institutionCode", q='GB')
##D 
##D # recorded by
##D occ_metadata(type = "recordedBy", q='scott')
##D 
##D # data as character strings
##D occ_metadata(type = "catalogNumber", q=122, pretty=FALSE)
##D 
##D # Change number of results returned
##D occ_metadata(type = "catalogNumber", q=122, limit=10)
##D 
##D # Partial unique type strings work too
##D occ_metadata(type = "cat", q=122)
##D 
##D # Pass on curl options
##D occ_metadata(type = "cat", q=122, curlopts = list(verbose = TRUE))
## End(Not run)



