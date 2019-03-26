library(rerddap)


### Name: browse
### Title: Browse a dataset webpage.
### Aliases: browse

### ** Examples

## Not run: 
##D # browse by dataset_id
##D browse('erdATastnhday')
##D 
##D # browse info class
##D my_info <- info('erdATastnhday')
##D browse(my_info)
##D 
##D # browse tabledap class
##D my_tabledap <- tabledap('erdCalCOFIlrvsiz', fields=c('latitude','longitude','larvae_size',
##D    'itis_tsn'), 'time>=2011-10-25', 'time<=2011-10-31')
##D browse(my_tabledap)
## End(Not run)



