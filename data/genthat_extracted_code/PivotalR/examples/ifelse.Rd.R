library(PivotalR)


### Name: ifelse
### Title: Conditional Element Selection
### Aliases: ifelse,db.obj-method

### ** Examples

## Not run: 
##D 
##D 
##D ## set up the database connection
##D ## Assume that .port is port number and .dbname is the database name
##D cid <- db.connect(port = .port, dbname = .dbname, verbose = FALSE)
##D 
##D ## create a table
##D x <- as.db.data.frame(abalone, conn.id = cid, verbose = FALSE)
##D 
##D ## create a new db.obj with one-column,
##D ## and values "small" or "big"
##D z <- ifelse(x$rings < 10, "small", "big")
##D 
##D db.disconnect(cid, verbose = FALSE)
## End(Not run)



