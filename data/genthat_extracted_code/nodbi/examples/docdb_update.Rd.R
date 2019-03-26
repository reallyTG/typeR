library(nodbi)


### Name: docdb_update
### Title: Update documents
### Aliases: docdb_update

### ** Examples

## Not run: 
##D # CouchDB
##D src <- src_couchdb()
##D docdb_create(src, "mtcars2", mtcars)
##D docdb_get(src, "mtcars2")
##D 
##D mtcars$letter <- sample(letters, NROW(mtcars), replace = TRUE)
##D invisible(docdb_update(src, "mtcars2", mtcars))
##D docdb_get(src, "mtcars2")
## End(Not run)



