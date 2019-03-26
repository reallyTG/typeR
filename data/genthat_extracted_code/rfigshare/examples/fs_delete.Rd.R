library(rfigshare)


### Name: fs_delete
### Title: Delete article (private or drafts only) or attached file
### Aliases: fs_delete

### ** Examples

## Not run: 
##D fs_delete(123)
##D 
##D ## Delete all attachments in the second-most-recent entry in my library
##D my_lib <- fs_browse(mine=TRUE)
##D article_id <- my_lib[[2]]$article_id
##D file_ids <- sapply(my_lib[[2]]$files, `[[`, "id")
##D sapply(file_ids, function(id) fs_delete(article_id, id))
## End(Not run)



