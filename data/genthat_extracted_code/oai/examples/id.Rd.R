library(oai)


### Name: id
### Title: Identify the OAI-PMH service for each data provider.
### Aliases: id

### ** Examples

## Not run: 
##D # datacite
##D id("http://oai.datacite.org/oai")
##D 
##D # arxiv
##D id("http://export.arxiv.org/oai2")
##D 
##D # GBIF - http://www.gbif.org/
##D id("http://api.gbif.org/v1/oai-pmh/registry")
##D 
##D # curl options
##D library("httr")
##D id("http://export.arxiv.org/oai2", config = verbose())
## End(Not run)



