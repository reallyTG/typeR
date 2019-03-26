library(PivotalR)


### Name: names-methods
### Title: The Names of an object
### Aliases: names,db.obj-method names<-,db.obj-method
### Keywords: methods database

### ** Examples

## Not run: 
##D 
##D 
##D ## set up the database connection
##D ## Assume that .port is port number and .dbname is the database name
##D cid <- db.connect(port = .port, dbname = .dbname, verbose = FALSE)
##D 
##D ## create a table from the example data.frame "abalone"
##D delete("abalone", conn.id = cid)
##D x <- as.db.data.frame(abalone, "abalone", conn.id = cid, verbose = FALSE)
##D ## preview of a table
##D lk(x, nrows = 10) # extract 10 rows of data
##D 
##D ## get names of all columns
##D names(x)
##D 
##D db.disconnect(cid, verbose = FALSE)
## End(Not run)



