library(rbison)


### Name: bison_tax
### Title: Search for and collect taxonomic name data from the USGS Bison
###   API using solr
### Aliases: bison_tax

### ** Examples

## Not run: 
##D # All taxa
##D bison_tax("*:*")
##D 
##D # Some example calls
##D bison_tax(query="*bear")
##D bison_tax(query="Helianthus", method="scientificName")
##D 
##D # Exact argument, here nothing found with latter call as '*bear' 
##D # doesn't exist, which makes sense
##D bison_tax(query="*bear", exact=FALSE)
##D bison_tax(query="*bear", exact=TRUE)
##D 
##D # Using solr arguments (not all Solr arguments work)
##D ## Return a certain number of rows
##D bison_tax(query="*bear", method="vernacularName", rows=3)
##D ## Return certain fields
##D bison_tax(query="*bear", method="vernacularName", fl='vernacularName')
##D 
##D # Curl options
##D bison_tax(query='*dolphin', callopts=list(verbose = TRUE))
## End(Not run)



