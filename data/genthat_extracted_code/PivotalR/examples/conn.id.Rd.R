library(PivotalR)


### Name: conn.id
### Title: Find out the connection ID of a 'db.obj' object
### Aliases: conn.id conn.id<-
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
##D db.list() # list the two connections
##D 
##D conn.eql(cid1, cid2) # returns TRUE
##D 
##D ## use the example data to create a table in connection 1
##D delete("abalone", conn.id = cid2)
##D x <- as.db.data.frame(abalone, "abalone", conn.id = cid1, verbose = FALSE)
##D 
##D db.disconnect(cid1) # disconnect connection 1
##D 
##D ## lookat(x) # gives an error since connection 1 is disconnected
##D 
##D conn.id(x) <- cid2 # 1 and 2 are the same
##D 
##D lk(x) # gives what you want
##D 
##D db.disconnect(cid2, verbose = FALSE)
## End(Not run)



