library(rerddap)


### Name: cache_list
### Title: List cached files
### Aliases: cache_list

### ** Examples

## Not run: 
##D # list files in cache
##D cache_list()
##D 
##D # List info for files
##D ## download some data first
##D tabledap('erdCinpKfmBT')
##D griddap('erdVHNchlamday',
##D  time = c('2015-04-01','2015-04-10'),
##D  latitude = c(18, 21),
##D  longitude = c(-120, -119)
##D )
##D 
##D (x <- cache_list())
##D cache_details(x$nc[1])
##D cache_details(x$csv[1])
##D cache_details()
##D 
##D # delete files by name in cache
##D # cache_delete(x$nc[1])
##D # cache_delete(x$nc[2:3])
## End(Not run)



