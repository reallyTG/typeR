library(PivotalR)


### Name: Arith-methods
### Title: Arithmetic Operators for 'db.obj' objects
### Aliases: 'Arith methods' +,db.obj,db.obj-method +,db.obj,numeric-method
###   +,numeric,db.obj-method +,db.obj,character-method
###   +,character,db.obj-method -,db.obj,ANY-method -,db.obj,db.obj-method
###   -,db.obj,numeric-method -,numeric,db.obj-method
###   -,db.obj,character-method -,character,db.obj-method
###   *,db.obj,db.obj-method *,db.obj,numeric-method
###   *,numeric,db.obj-method /,db.obj,db.obj-method
###   /,db.obj,numeric-method /,numeric,db.obj-method
###   %/%,db.obj,db.obj-method %/%,db.obj,numeric-method
###   %/%,numeric,db.obj-method %%,db.obj,db.obj-method
###   %%,db.obj,numeric-method %%,numeric,db.obj-method
###   ^,db.obj,db.obj-method ^,db.obj,numeric-method
###   ^,numeric,db.obj-method
### Keywords: math

### ** Examples

## Not run: 
##D ## get the help for a method
##D ## help("+,db.obj,db.obj-method")
##D 
##D 
##D 
##D ## set up the database connection
##D ## Assume that .port is port number and .dbname is the database name
##D cid <- db.connect(port = .port, dbname = .dbname, verbose = FALSE)
##D 
##D ## ----------------------------------------------------------------------
##D 
##D ## create a table from the example data.frame "abalone"
##D delete("abalone", conn.id = cid)
##D x <- as.db.data.frame(abalone, "abalone", conn.id = cid, verbose = FALSE)
##D 
##D x$rings <- (x$rings + 2.3) * 3 # change the values
##D 
##D x$area <- x$length * x$height # add a new column
##D 
##D lk(x$area, 10) # view the actual values computed in database
##D 
##D fit <- madlib.lm(rings ~ area, data = x)
##D 
##D ## ----------------------------------------------------------------------
##D 
##D db.disconnect(cid, verbose = FALSE)
## End(Not run)



