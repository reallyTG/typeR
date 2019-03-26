library(sofa)


### Name: db_index
### Title: Create and get database indexes
### Aliases: db_index db_index_create db_index_delete

### ** Examples

## Not run: 
##D (x <- Cushion$new())
##D 
##D # create a database first
##D if ("testing" %in% db_list(x)) {
##D   invisible(db_delete(x, dbname="testing"))
##D }
##D db_create(x, "testing")
##D 
##D # get indexes
##D db_index(x, "testing")
##D 
##D # create indexes
##D body <- list(index = list(fields = I("foo")), name = "foo-index", type = "json")
##D db_index_create(x, "testing", body = body)
##D 
##D # get indexes, after creating another index
##D db_index(x, "testing")
##D 
##D # delete an index
##D res <- db_index(x, "testing")
##D db_index_delete(x, "testing", res$indexes[[2]]$ddoc, res$indexes[[2]]$name)
##D ## and it's gone
##D db_index(x, "testing")
## End(Not run)



