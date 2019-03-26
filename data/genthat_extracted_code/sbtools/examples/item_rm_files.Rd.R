library(sbtools)


### Name: item_rm_files
### Title: Remove files associated with an item
### Aliases: item_rm_files

### ** Examples

## Not run: 
##D res <- item_create(user_id(), "item456") 
##D cat("foo bar", file = "foobar.txt")
##D item_append_files(res, "foobar.txt")
##D res <- item_get(res)
##D res$files[[1]]$name
##D res2 <- item_rm_files(res)
##D res2$files
## End(Not run)



