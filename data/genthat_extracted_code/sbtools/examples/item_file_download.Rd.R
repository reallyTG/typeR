library(sbtools)


### Name: item_file_download
### Title: Download files attached to item
### Aliases: item_file_download

### ** Examples

## Not run: 
##D 
##D #downloads two files attached to this item
##D item_file_download('548b2b31e4b03f64633662a4', dest_dir=tempdir())
##D 
##D #downloads a specific file attached to this item
##D item_file_download('548b2b31e4b03f64633662a4', names='gdp.txt',
##D 		destinations=file.path(tempdir(), 'fname.txt'))
## End(Not run)



