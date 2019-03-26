library(PivotalR)


### Name: Func-methods
### Title: Mathematical functions that take 'db.obj' objects as the
###   argument
### Aliases: 'Math Functions' exp abs log log10 sign sqrt factorial
###   exp,db.obj-method abs,db.obj-method log,db.obj-method
###   log10,db.obj-method sign,db.obj-method sqrt,db.obj-method
###   factorial,db.obj-method sin,db.obj-method cos,db.obj-method
###   asin,db.obj-method acos,db.obj-method atan,db.obj-method
###   tan,db.obj-method atan2,db.obj,db.obj-method
###   atan2,db.obj,numeric-method atan2,numeric,db.obj-method
### Keywords: methods math

### ** Examples

## Not run: 
##D ## get the help for a method
##D ## help("+,db.obj,db.obj-method")
##D 
##D 
##D ## set up the database connection
##D ## Assume that .port is port number and .dbname is the database name
##D cid <- db.connect(port = .port, dbname = .dbname)
##D 
##D ## create a table from the example data.frame "abalone"
##D delete("abalone", conn.id = cid)
##D x <- as.db.data.frame(abalone, "abalone", conn.id = cid)
##D 
##D x$rings <- exp(x$rings) # change the values
##D 
##D x$area <- log((x$length + 1) * (x$height + 1)) # add a new column
##D 
##D lk(x$area, 10) # view the actual values computed in database
##D 
##D fit <- madlib.lm(rings ~ area, data = x)
##D 
##D db.disconnect(cid, verbose = FALSE)
## End(Not run)



