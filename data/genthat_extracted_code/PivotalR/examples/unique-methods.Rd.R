library(PivotalR)


### Name: unique-methods
### Title: The Unique of an object
### Aliases: unique,db.obj-method
### Keywords: methods database

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
##D ## get unique of all columns
##D unique(x$sex)
##D 
##D db.disconnect(cid, verbose = FALSE)
## End(Not run)



