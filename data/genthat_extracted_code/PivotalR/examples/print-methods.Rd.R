library(PivotalR)


### Name: print-methods
### Title: Display the connection information associated with a 'db' object
### Aliases: print,db.data.frame-method print,db.Rquery-method
###   show,db.data.frame-method show,db.Rquery-method
### Keywords: IO utility

### ** Examples

## Not run: 
##D 
##D 
##D ## set up the database connection
##D ## Assume that .port is port number and .dbname is the database name
##D cid <- db.connect(port = .port, dbname = .dbname, verbose = FALSE)
##D 
##D ## create a table from the example data.frame "abalone"
##D x <- as.db.data.frame(abalone, conn.id = cid, verbose = FALSE)
##D 
##D ## printing db.data.frame object
##D x # Display the associated table, and database information for x
##D 
##D db.disconnect(cid, verbose = FALSE)
## End(Not run)



