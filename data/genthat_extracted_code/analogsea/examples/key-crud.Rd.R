library(analogsea)


### Name: key-crud
### Title: Create, update, and delete ssh keys.
### Aliases: key-crud key_create key_rename key_delete

### ** Examples

## Not run: 
##D k <- key_create("key", readLines("~/.ssh/id_rsa.pub"))
##D k <- key_rename(k, "new_name")
##D key_delete(k)
## End(Not run)



