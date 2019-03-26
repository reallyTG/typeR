library(PivotalR)


### Name: subset-methods
### Title: Extract a subset of a table or view
### Aliases: subset,db.obj-method
### Keywords: data operation database

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
##D lk(x[1:3])
##D lk(subset(x, 1:3))
##D 
##D db.disconnect(cid, verbose = FALSE)
## End(Not run)



