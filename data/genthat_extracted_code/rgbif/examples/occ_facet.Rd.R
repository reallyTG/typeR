library(rgbif)


### Name: occ_facet
### Title: Facet GBIF occurrences
### Aliases: occ_facet

### ** Examples

## Not run: 
##D occ_facet(facet = "country")
##D 
##D # facetMincount - minimum number of records to be included
##D #   in the faceting results
##D occ_facet(facet = "country", facetMincount = 30000000L)
##D occ_facet(facet = c("country", "basisOfRecord"))
##D 
##D # paging with many facets
##D occ_facet(
##D   facet = c("country", "basisOfRecord", "hasCoordinate"),
##D   country.facetLimit = 3,
##D   basisOfRecord.facetLimit = 6
##D )
##D 
##D # paging
##D ## limit
##D occ_facet(facet = "country", country.facetLimit = 3)
##D ## offset
##D occ_facet(facet = "country", country.facetLimit = 3,
##D   country.facetOffset = 3)
##D 
##D # Pass on curl options
##D occ_facet(facet = "country", country.facetLimit = 3,
##D   curlopts = list(verbose = TRUE))
## End(Not run)



