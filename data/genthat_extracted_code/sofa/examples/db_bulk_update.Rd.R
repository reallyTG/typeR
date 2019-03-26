library(sofa)


### Name: db_bulk_update
### Title: Create documents via the bulk API
### Aliases: db_bulk_update

### ** Examples

## Not run: 
##D # initialize a CouchDB connection
##D (x <- Cushion$new())
##D 
##D row.names(mtcars) <- NULL
##D 
##D if ("bulktest" %in% db_list(x)) {
##D   invisible(db_delete(x, dbname="bulktest"))
##D }
##D db_create(x, dbname="bulktest")
##D db_bulk_create(x, mtcars, dbname="bulktest")
##D 
##D # modify mtcars
##D mtcars$letter <- sample(letters, NROW(mtcars), replace = TRUE)
##D db_bulk_update(x, "bulktest", mtcars)
##D 
##D # change again
##D mtcars$num <- 89
##D db_bulk_update(x, "bulktest", mtcars)
## End(Not run)



