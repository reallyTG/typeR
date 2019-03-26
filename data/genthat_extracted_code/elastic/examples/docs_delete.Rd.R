library(elastic)


### Name: docs_delete
### Title: Delete a document
### Aliases: docs_delete

### ** Examples

## Not run: 
##D if (!index_exists("plos")) {
##D  plosdat <- system.file("examples", "plos_data.json", package = "elastic")
##D  docs_bulk(plosdat)
##D }
##D 
##D # delete a document
##D if (!docs_get(index='plos', type='article', id=36, exists=TRUE)) {
##D   docs_create(index='plos', type='article', id=36, 
##D     body = list(id="12345", title="New title")
##D   )
##D }
##D docs_get(index='plos', type='article', id=36)
##D docs_delete(index='plos', type='article', id=36)
##D # docs_get(index='plos', type='article', id=36) # and the document is gone
## End(Not run)



