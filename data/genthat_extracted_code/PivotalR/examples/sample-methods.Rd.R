library(PivotalR)


### Name: sample-methods
### Title: Methods for sampling rows of data from a table/view randomly
### Aliases: sample,db.obj-method
### Keywords: methods database stats math utility

### ** Examples

## Not run: 
##D 
##D 
##D ## set up the database connection
##D ## Assume that .port is port number and .dbname is the database name
##D cid <- db.connect(port = .port, dbname = .dbname, verbose = FALSE)
##D 
##D y <- as.db.data.frame(abalone, conn.id = cid, verbose = FALSE)
##D lk(y, 10)
##D 
##D dim(y)
##D 
##D a <- sample(y, 20)
##D 
##D dim(a)
##D 
##D lookat(a)
##D 
##D b <- sample(y, 40, replace = TRUE)
##D 
##D dim(b)
##D 
##D lookat(b)
##D 
##D delete(b)
##D 
##D db.disconnect(cid, verbose = FALSE)
## End(Not run)



