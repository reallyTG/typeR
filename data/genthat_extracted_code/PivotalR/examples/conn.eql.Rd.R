library(PivotalR)


### Name: conn.eql
### Title: Check whether two connections are the same
### Aliases: conn.eql
### Keywords: database utility

### ** Examples

## Not run: 
##D 
##D 
##D ## set up the database connection
##D ## Assume that .port is port number and .dbname is the database name
##D cid1 <- db.connect(port = .port, dbname = .dbname, verbose = FALSE)
##D cid2 <- db.connect(port = .port, dbname = .dbname, verbose = FALSE)
##D 
##D db.list() # list the above two connections
##D 
##D conn.eql(cid1, cid2) # returns TRUE
##D 
##D db.disconnect(cid1, verbose = FALSE)
##D db.disconnect(cid2, verbose = FALSE)
## End(Not run)



