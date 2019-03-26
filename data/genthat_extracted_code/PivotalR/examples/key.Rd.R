library(PivotalR)


### Name: key
### Title: Get or set the primary key for a table
### Aliases: key key<-
### Keywords: database data operation

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
##D x <- db.data.frame(content(tmp), key = 'id', conn.id = cid, verbose = FALSE)
##D 
##D ## getting the primary key
##D key(x) # Display the primary key for x
##D 
##D ## Changing the primary key
##D key(x) <- 'length'
##D 
##D db.disconnect(cid, verbose = FALSE)
## End(Not run)



