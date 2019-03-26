library(elastic)


### Name: docs_update
### Title: Update a document
### Aliases: docs_update

### ** Examples

## Not run: 
##D connect()
##D if (!index_exists('plos')) {
##D   plosdat <- system.file("examples", "plos_data.json", package = "elastic")
##D   invisible(docs_bulk(plosdat))
##D }
##D 
##D docs_create(index='plos', type='article', id=1002, 
##D   body=list(id="12345", title="New title"))
##D # and the document is there now
##D docs_get(index='plos', type='article', id=1002) 
##D # update the document
##D docs_update(index='plos', type='article', id=1002, 
##D   body = list(doc = list(title = "Even newer title again")))
##D # get it again, notice changes
##D docs_get(index='plos', type='article', id=1002) 
##D 
##D if (!index_exists('stuffthings')) {
##D   index_create("stuffthings")
##D }
##D docs_create(index='stuffthings', type='thing', id=1, 
##D   body=list(name = "foo", what = "bar"))
##D docs_update(index='stuffthings', type='thing', id=1, 
##D   body = list(doc = list(name = "hello", what = "bar")), 
##D   source = 'name')
## End(Not run)



