library(elastic)


### Name: docs_create
### Title: Create a document
### Aliases: docs_create

### ** Examples

## Not run: 
##D connect()
##D if (!index_exists('plos')) {
##D   plosdat <- system.file("examples", "plos_data.json", package = "elastic")
##D   invisible(docs_bulk(plosdat))
##D }
##D 
##D # give a document id
##D x <- docs_create(index='plos', type='article', id=1002, 
##D   body=list(id="12345", title="New title"))
##D x
##D # and the document is there now
##D docs_get(index='plos', type='article', id=1002)
##D 
##D # let Elasticsearch create the document id for you
##D x <- docs_create(index='plos', type='article', 
##D   body=list(id="6789", title="Some title"))
##D x
##D # and the document is there now
##D docs_get(index='plos', type='article', id=x$`_id`)
## End(Not run)



