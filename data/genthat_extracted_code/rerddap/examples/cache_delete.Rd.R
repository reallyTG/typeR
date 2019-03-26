library(rerddap)


### Name: cache_delete
### Title: Delete cached files
### Aliases: cache_delete cache_delete_all

### ** Examples

## Not run: 
##D # delete files by name in cache
##D # cache_delete('9911750294a039b8b517c8bf288978ea.csv')
##D # cache_delete(c('9911750294a039b8b517c8bf288978ea.csv',
##D #                'b26825b6737da13d6a52c28c8dfe690f.csv'))
##D 
##D # You can delete from the output of griddap or tabledap fxns
##D ## tabledap
##D (table_res <- tabledap('erdCinpKfmBT'))
##D cache_delete(table_res)
##D 
##D ## griddap
##D (out <- info('erdQMekm14day'))
##D (grid_res <- griddap(out,
##D  time = c('2015-12-28','2016-01-01'),
##D  latitude = c(24, 23),
##D  longitude = c(88, 90)
##D ))
##D cache_delete(grid_res)
## End(Not run)



