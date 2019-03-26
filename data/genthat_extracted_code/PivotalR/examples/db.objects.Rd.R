library(PivotalR)


### Name: db.objects
### Title: List all the existing tables/views in a database with their
###   schema names
### Aliases: db.objects
### Keywords: utility database

### ** Examples

## Not run: 
##D 
##D 
##D ## set up the database connection
##D ## Assume that .port is port number and .dbname is the database name
##D cid <- db.connect(port = .port, dbname = .dbname, verbose = FALSE)
##D 
##D ## create a table using as.db.data.frame
##D delete("abalone", conn.id = cid)
##D x <- as.db.data.frame(abalone, "abalone", conn.id = cid)
##D 
##D db.objects(conn.id = cid) # list all tables/views
##D 
##D ## list all tables/views start with "madlibtestdata.lin"
##D ## where "madlibtestdata" is the schema name
##D db.objects("^madlibtestdata.lin", cid)
##D 
##D db.disconnect(cid, verbose = FALSE)
## End(Not run)



