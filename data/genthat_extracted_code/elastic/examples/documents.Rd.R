library(elastic)


### Name: documents
### Title: Elasticsearch documents functions.
### Aliases: documents

### ** Examples

## Not run: 
##D # Get a document
##D # docs_get(index='plos', type='article', id=1)
##D 
##D # Get multiple documents
##D # docs_mget(index="shakespeare", type="line", id=c(9,10))
##D 
##D # Create a document
##D # docs_create(index='plos', type='article', id=35, body=list(id="12345", title="New title"))
##D 
##D # Delete a document
##D # docs_delete(index='plos', type='article', id=35)
##D 
##D # Bulk load documents
##D # plosdat <- system.file("examples", "plos_data.json", package = "elastic")
##D # docs_bulk(plosdat)
## End(Not run)



