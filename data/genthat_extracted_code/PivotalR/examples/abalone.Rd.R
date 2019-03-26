library(PivotalR)


### Name: abalone
### Title: Abalone data set
### Aliases: abalone
### Keywords: datasets

### ** Examples

## Not run: 
##D 
##D 
##D 
##D ## Assume that .port is port number and .dbname is the database name
##D cid <- db.connect(port = .port, dbname = .dbname, verbose = FALSE)
##D 
##D ## create a table from the example data.frame "abalone"
##D ## The user does not need to run data(abalone) to load the data
##D delete("abalone", conn.id = cid)
##D x <- as.db.data.frame(abalone, "abalone", key = "id",
##D                       distributed.by = "id", conn.id = cid,
##D                       verbose = FALSE)
##D 
##D ## preview the actual data
##D lk(x)
##D 
##D ## preview the actual data ordered by id
##D lk(sort(x, FALSE, x$id))
##D 
##D db.disconnect(cid, verbose = FALSE)
## End(Not run)



