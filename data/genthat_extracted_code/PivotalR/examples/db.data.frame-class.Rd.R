library(PivotalR)


### Name: db.data.frame-class
### Title: Class '"db.data.frame"'
### Aliases: db.data.frame-class
### Keywords: classes database

### ** Examples

## Not run: 
##D showClass("db.data.frame")
##D 
##D 
##D 
##D ## set up the database connection
##D ## Assume that .port is port number and .dbname is the database name
##D cid <- db.connect(port = .port, dbname = .dbname, verbose = FALSE)
##D 
##D delete("abalone", conn.id = cid)
##D as.db.data.frame(abalone, "abalone", conn.id = cid, verbose = FALSE)
##D x <- db.data.frame("abalone", conn.id = cid, verbose = FALSE) # x points to table "abalone"
##D 
##D lk(x)
##D 
##D db.disconnect(cid, verbose = FALSE)
## End(Not run)



