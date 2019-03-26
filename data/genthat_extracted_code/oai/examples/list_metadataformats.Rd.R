library(oai)


### Name: list_metadataformats
### Title: List available metadata formats from various providers.
### Aliases: list_metadataformats

### ** Examples

## Not run: 
##D list_metadataformats()
##D 
##D # no metadatformats for an identifier
##D list_metadataformats(id = "oai:oai.datacite.org:22")
##D 
##D # metadatformats available for an identifier
##D list_metadataformats(id = "oai:oai.datacite.org:32348")
##D 
##D # curl options
##D library("httr")
##D list_metadataformats(id = "oai:oai.datacite.org:32348", config = verbose())
## End(Not run)



