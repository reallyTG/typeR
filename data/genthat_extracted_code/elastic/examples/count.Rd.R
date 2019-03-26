library(elastic)


### Name: count
### Title: Get counts of the number of records per index.
### Aliases: count

### ** Examples

## Not run: 
##D count()
##D count(index='plos')
##D count(index='plos', type='article')
##D count(index='shakespeare')
##D count(index=c('plos','shakespeare'), q="a*")
##D count(index=c('plos','shakespeare'), q="z*")
##D 
##D # Curl options
##D library("httr")
##D count(callopts=verbose())
## End(Not run)



