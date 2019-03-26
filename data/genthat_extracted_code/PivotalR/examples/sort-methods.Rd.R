library(PivotalR)


### Name: sort
### Title: Sort a table or view by a set of columns
### Aliases: sort,db.obj-method
### Keywords: database methods utility

### ** Examples

## Not run: 
##D 
##D 
##D ## set up the database connection
##D ## Assume that .port is port number and .dbname is the database name
##D cid <- db.connect(port = .port, dbname = .dbname, verbose = FALSE)
##D 
##D x <- as.db.data.frame(abalone, conn.id = cid, verbose = FALSE)
##D lk(x, 10)
##D 
##D y  <- sort(x, decreasing = FALSE, list(x$id, x$sex) )
##D # get the SQL query to be run
##D content(y)
##D # get the sorted output
##D lk(y, 20)
##D 
##D db.disconnect(cid, verbose = FALSE)
## End(Not run)



