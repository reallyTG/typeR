library(rerddap)


### Name: ed_search
### Title: Search for ERDDAP tabledep or griddap datasets
### Aliases: ed_search ed_datasets

### ** Examples

## Not run: 
##D (out <- ed_search(query='temperature'))
##D out$alldata[[1]]
##D (out <- ed_search(query='size'))
##D out$info
##D 
##D # List datasets
##D ed_datasets('table')
##D ed_datasets('grid')
##D 
##D # use a different ERDDAP server
##D ## Marine Institute (Ireland)
##D ed_search("temperature", url = "http://erddap.marine.ie/erddap/")
## End(Not run)



