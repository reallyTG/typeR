library(PivotalR)


### Name: db.list
### Title: List all the currently active connections with their information
### Aliases: db.list
### Keywords: utility database

### ** Examples

## Not run: 
##D 
##D 
##D ## set up the database connection
##D ## Assume that .port is port number and .dbname is the database name
##D cid1 <- db.connect(port = .port, dbname = .dbname, verbose = FALSE)
##D cid2 <- db.connect(port = .port, dbname = .dbname, verbose = FALSE)
##D 
##D db.list() # list the two connections
##D 
##D db.disconnect(cid1, verbose = FALSE)
##D db.disconnect(cid2, verbose = FALSE)
## End(Not run)



