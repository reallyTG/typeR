library(PivotalR)


### Name: Compare-methods
### Title: Comparison Operators for 'db.obj' objects
### Aliases: 'Compare methods' >,character,db.obj-method
###   >,db.obj,character-method >,db.obj,db.obj-method
###   >,db.obj,numeric-method >,numeric,db.obj-method
###   <,character,db.obj-method <,db.obj,character-method
###   <,db.obj,db.obj-method <,db.obj,numeric-method
###   <,numeric,db.obj-method >=,character,db.obj-method
###   >=,db.obj,character-method >=,db.obj,db.obj-method
###   >=,db.obj,numeric-method >=,numeric,db.obj-method
###   <=,character,db.obj-method <=,db.obj,character-method
###   <=,db.obj,db.obj-method <=,db.obj,numeric-method
###   <=,numeric,db.obj-method ==,character,db.obj-method
###   ==,db.obj,character-method ==,db.obj,db.obj-method
###   ==,db.obj,numeric-method ==,numeric,db.obj-method
###   !=,character,db.obj-method !=,db.obj,character-method
###   !=,db.obj,db.obj-method !=,db.obj,numeric-method
###   !=,numeric,db.obj-method ==,db.obj,logical-method
###   ==,logical,db.obj-method !=,db.obj,logical-method
###   !=,logical,db.obj-method grepl grepl,character,db.obj-method
### Keywords: methods math

### ** Examples

## Not run: 
##D ## get the help for a method
##D ## help(">,db.obj,db.obj-method")
##D 
##D 
##D ## set up the database connection
##D ## Assume that .port is port number and .dbname is the database name
##D cid <- db.connect(port = .port, dbname = .dbname, verbose = FALSE)
##D 
##D ## create a table from the example data.frame "abalone"
##D delete("abalone", conn.id = cid)
##D x <- as.db.data.frame(abalone, "abalone", conn.id = cid, verbose = FALSE)
##D 
##D lk(x[x$length > 10,])
##D 
##D db.disconnect(cid, verbose = FALSE)
## End(Not run)



