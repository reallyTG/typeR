library(PivotalR)


### Name: is.factor-methods
### Title: Detect whether a 'db.obj' object is a categorical object
### Aliases: is.factor,db.obj-method
### Keywords: methods math

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
##D ## set sex to be a categorical variable
##D x$sex <- as.factor(x$sex)
##D 
##D is.factor(x$sex)
##D 
##D is.factor(x)
##D 
##D db.disconnect(cid, verbose = FALSE)
## End(Not run)



