library(sofa)


### Name: db_explain
### Title: Explain API
### Aliases: db_explain

### ** Examples

## Not run: 
##D ## create a connection
##D (x <- Cushion$new())
##D 
##D file <- system.file("examples/omdb.json", package = "sofa")
##D strs <- readLines(file)
##D 
##D ## create a database
##D if ("omdb" %in% db_list(x)) {
##D   invisible(db_delete(x, dbname="omdb"))
##D }
##D db_create(x, dbname='omdb')
##D 
##D ## add some documents
##D invisible(db_bulk_create(x, "omdb", strs))
##D 
##D ## query all in one json blob
##D db_explain(x, dbname = "omdb", query = '{
##D   "selector": {
##D     "_id": {
##D       "$gt": null
##D     }
##D   }
##D }')
## End(Not run)



