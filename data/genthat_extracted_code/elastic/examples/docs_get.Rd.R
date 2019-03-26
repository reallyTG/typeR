library(elastic)


### Name: docs_get
### Title: Get documents
### Aliases: docs_get

### ** Examples

## Not run: 
##D docs_get(index='shakespeare', type='line', id=10)
##D docs_get(index='shakespeare', type='line', id=12)
##D docs_get(index='shakespeare', type='line', id=12, source=TRUE)
##D 
##D # Get certain fields
##D if (gsub("\\.", "", ping()$version$number) < 500) {
##D   ### ES < v5
##D   docs_get(index='shakespeare', type='line', id=10, fields='play_name')
##D   docs_get(index='shakespeare', type='line', id=10, 
##D     fields=c('play_name','speaker'))
##D } else {
##D   ### ES > v5
##D   docs_get(index='shakespeare', type='line', id=10, source='play_name')
##D   docs_get(index='shakespeare', type='line', id=10, 
##D     source=c('play_name','speaker'))
##D }
##D 
##D # Just test for existence of the document
##D docs_get(index='plos', type='article', id=1, exists=TRUE)
##D docs_get(index='plos', type='article', id=123456, exists=TRUE)
## End(Not run)



