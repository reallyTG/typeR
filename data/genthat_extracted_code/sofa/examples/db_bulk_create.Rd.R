library(sofa)


### Name: db_bulk_create
### Title: Create documents via the bulk API
### Aliases: db_bulk_create

### ** Examples

## Not run: 
##D # initialize a CouchDB connection
##D (x <- Cushion$new())
##D 
##D # From a data.frame
##D if ("bulktest" %in% db_list(x)) {
##D   invisible(db_delete(x, dbname="bulktest"))
##D }
##D db_create(x, dbname="bulktest")
##D db_bulk_create(x, "bulktest", mtcars)
##D 
##D if ("bulktest2" %in% db_list(x)) {
##D   invisible(db_delete(x, dbname="bulktest2"))
##D }
##D db_create(x, dbname="bulktest2")
##D db_bulk_create(x, "bulktest2", iris)
##D 
##D # data.frame with 1 or more columns as neseted lists
##D mtcars$stuff <- list("hello_world")
##D mtcars$stuff2 <- list("hello_world","things")
##D if ("bulktest3" %in% db_list(x)) {
##D   invisible(db_delete(x, dbname="bulktest3"))
##D }
##D db_create(x, dbname="bulktest3")
##D db_bulk_create(x, "bulktest3", mtcars)
##D 
##D # From a json character string, or more likely, many json character strings
##D library("jsonlite")
##D strs <- as.character(parse_df(mtcars, "columns"))
##D if ("bulkfromchr" %in% db_list(x)) {
##D   invisible(db_delete(x, dbname="bulkfromchr"))
##D }
##D db_create(x, dbname="bulkfromchr")
##D db_bulk_create(x, "bulkfromchr", strs)
##D 
##D # From a list of lists
##D library("jsonlite")
##D lst <- parse_df(mtcars, tojson=FALSE)
##D if ("bulkfromchr" %in% db_list(x)) {
##D   invisible(db_delete(x, dbname="bulkfromchr"))
##D }
##D db_create(x, dbname="bulkfromchr")
##D db_bulk_create(x, "bulkfromchr", lst)
##D 
##D # iris dataset - by rows
##D if ("irisrows" %in% db_list(x)) {
##D   invisible(db_delete(x, dbname="irisrows"))
##D }
##D db_create(x, dbname="irisrows")
##D db_bulk_create(x, "irisrows", apply(iris, 1, as.list))
##D 
##D # iris dataset - by columns - doesn't quite work yet
##D # if ("iriscolumns" %in% db_list(x)) {
##D #   invisible(db_delete(x, dbname="iriscolumns"))
##D # }
##D # db_create(x, dbname="iriscolumns")
##D # db_bulk_create(x, "iriscolumns", parse_df(iris, "columns", tojson=FALSE), how="columns")
## End(Not run)



