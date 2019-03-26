library(PivotalR)


### Name: Logical-methods
### Title: Logical operations for 'db.obj' objects
### Aliases: 'Logical methods' &,db.obj,db.obj-method
###   &,db.obj,logical-method &,logical,db.obj-method
###   |,db.obj,db.obj-method |,db.obj,logical-method
###   |,logical,db.obj-method !,db.obj-method
### Keywords: methods math

### ** Examples

## Not run: 
##D ## get the help for a method
##D ## help("|,db.obj,db.obj-method")
##D 
##D 
##D 
##D ## set up the database connection
##D ## Assume that .port is port number and .dbname is the database name
##D cid <- db.connect(port = .port, dbname = .dbname, verbose = FALSE)
##D 
##D ## create a table from the example data.frame "abalone"
##D x <- as.db.data.frame(abalone, conn.id = cid, verbose = FALSE)
##D 
##D lk(x$rings[x$length > 10 & x$height < 2,])
##D 
##D db.disconnect(cid, verbose = FALSE)
## End(Not run)



