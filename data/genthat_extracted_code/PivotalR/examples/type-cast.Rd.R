library(PivotalR)


### Name: Type Cast functions
### Title: Cast columns of 'db.obj' objects to other types
### Aliases: 'Type Cast functions' as.integer as.character as.double
###   as.logical as.numeric as.integer,db.obj-method
###   as.character,db.obj-method as.double,db.obj-method
###   as.logical,db.obj-method as.numeric,db.obj-method
###   as.Date,db.obj-method db.date.style as.time as.timestamp as.interval
###   col.types
### Keywords: utility data operation

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
##D z <- as.integer(x > 1)
##D lookat(z, 10)
##D 
##D z <- as.integer(x[,2] == "M")
##D lookat(z, 10)
##D 
##D col.types(x)
##D 
##D col.types(z)
##D 
##D db.disconnect(cid, verbose = FALSE)
## End(Not run)



