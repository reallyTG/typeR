library(PivotalR)


### Name: db.Rquery-class
### Title: Class '"db.Rquery"' and its sub-class 'db.Rview-class'
### Aliases: db.Rquery-class db.Rview-class
### Keywords: classes database

### ** Examples

## Not run: 
##D showClass("db.Rquery")
##D 
##D 
##D 
##D ## set up the database connection
##D ## Assume that .port is port number and .dbname is the database name
##D cid <- db.connect(port = .port, dbname = .dbname)
##D 
##D delete("abalone", conn.id = cid)
##D x <- as.db.data.frame(abalone, "abalone", conn.id = cid)
##D 
##D ## create several db.Rquery objects
##D y <- x[,1:2]
##D z <- x[x$rings > 10,]
##D 
##D dim(z) # get an error
##D 
##D lk(y)
##D 
##D lk(z)
##D 
##D ## materialize a db.Rquery object
##D z <- as.db.data.frame(z, "abalone_rings_larger_10")
##D delete("abalone_rings_larger_10", conn.id = cid)
##D 
##D dim(z) # no error
##D 
##D db.disconnect(cid, verbose = FALSE)
## End(Not run)



