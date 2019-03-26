library(PivotalR)


### Name: content
### Title: Print the content of a 'db.obj' object
### Aliases: content
### Keywords: utility database

### ** Examples

## Not run: 
##D 
##D 
##D ## set up the database connection
##D ## Assume that .port is port number and .dbname is the database name
##D cid <- db.connect(port = .port, dbname = .dbname, verbose = FALSE)
##D 
##D delete("abalone", conn.id = cid)
##D y <- as.db.data.frame(abalone, "abalone", conn.id = cid) # create a table
##D x <- db.data.frame("abalone", conn.id = cid, key = "id")
##D 
##D ## actually, x and y are pointing the same table
##D eql(x, y) # returns TRUE
##D 
##D content(x)
##D content(x$id)
##D content(x$id < 10)
##D content(x[,1:5])
##D content(x == y) # this is different from eql(x, y)
##D content(sort(x, INDICES = x$id))
##D content(x[x$id<10,])
##D content(x[1:10,])
##D content(colSums(x))
##D content(by(x, NULL, sum))
##D content(by(x, x$sex, sum))
##D 
##D db.disconnect(cid, verbose = FALSE)
## End(Not run)



