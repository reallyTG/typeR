library(PivotalR)


### Name: is.na-method
### Title: Query if the entries in a table are NULL
### Aliases: is.na,db.obj-method
### Keywords: database math utility

### ** Examples

## Not run: 
##D 
##D 
##D ## set up the database connection
##D ## Assume that .port is port number and .dbname is the database name
##D cid <- db.connect(port = .port, dbname = .dbname, verbose = FALSE)
##D 
##D ## create a temp table from the example data.frame "abalone"
##D x <- as.db.data.frame(abalone, conn.id = cid, verbose = FALSE)
##D 
##D #Query which entries of x are NULL
##D is.na(x)
##D 
##D y <- x
##D y[is.na(y)] <- 3
##D 
##D z <- x
##D z[is.na(x$height),"height"] <- 23
##D 
##D db.disconnect(cid, verbose = FALSE)
## End(Not run)



