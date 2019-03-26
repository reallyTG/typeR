library(PivotalR)


### Name: eql-methods
### Title: Test if two objects point to the same table
### Aliases: eql eql,db.obj,db.obj-method
### Keywords: database utility

### ** Examples

## Not run: 
##D 
##D 
##D ## set up the database connection
##D ## Assume that .port is port number and .dbname is the database name
##D cid <- db.connect(port = .port, dbname = .dbname, verbose = FALSE)
##D 
##D delete("abalone", conn.id = cid)
##D as.db.data.frame(abalone, "abalone", conn.id = cid, verbose = FALSE)
##D 
##D x <- db.data.frame('abalone', conn.id = cid, key = 'id') # use default connection 1
##D 
##D y <- db.data.frame('abalone', conn.id = cid)
##D 
##D ## Check for equality
##D eql(x,y) # This returns true
##D 
##D ## create a db.Rquery object
##D z <- x[,] # x is a db.data.frame object, but z is not
##D 
##D eql(x,z) # This returns false
##D 
##D db.disconnect(cid, verbose = FALSE)
## End(Not run)



