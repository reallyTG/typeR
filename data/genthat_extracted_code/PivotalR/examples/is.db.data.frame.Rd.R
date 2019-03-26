library(PivotalR)


### Name: is.db.data.frame
### Title: Check if an object is of type 'db.data.frame'
### Aliases: is.db.data.frame
### Keywords: database utility

### ** Examples

## Not run: 
##D 
##D 
##D ## set up the database connection
##D ## Assume that .port is port number and .dbname is the database name
##D cid <- db.connect(port = .port, dbname = .dbname, verbose = FALSE)
##D 
##D ## create a table from the example data.frame "abalone"
##D tmp <- as.db.data.frame(abalone, conn.id = cid, verbose = FALSE)
##D x <- db.data.frame(content(tmp), conn.id = cid, key = 'id')
##D 
##D ## getting the primary key
##D is.db.data.frame(x) #check if x is of type db.data.frame
##D 
##D db.disconnect(cid, verbose = FALSE)
## End(Not run)



