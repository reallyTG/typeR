library(rdrop2)


### Name: drop_search
### Title: Returns metadata for all files and folders whose filename
###   contains the given search string as a substring.
### Aliases: drop_search

### ** Examples

## Not run: 
##D # If you know me, you know why this query exists
##D drop_search('gif') %>% select(path, is_dir, mime_type)
## End(Not run)



