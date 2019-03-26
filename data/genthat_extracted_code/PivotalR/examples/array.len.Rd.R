library(PivotalR)


### Name: array.len
### Title: Get the length of the array in an array column
### Aliases: array.len
### Keywords: data operation utility

### ** Examples

## Not run: 
##D 
##D 
##D 
##D ## set up the database connection
##D ## Assume that .port is port number and .dbname is the database name
##D cid <- db.connect(port = .port, dbname = .dbname, verbose = FALSE)
##D 
##D delete("abalone", conn.id = cid)
##D x <- as.db.data.frame(abalone, "abalone", conn.id = cid, verbose = FALSE)
##D y <- db.array(x[-2]) # put columns into an array
##D names(y) # "agg_opr"
##D array.len(y$agg_opr) # 9
##D 
##D db.disconnect(cid, verbose = FALSE)
## End(Not run)



