library(PivotalR)


### Name: db.existsObject
### Title: Test whether an object exists in the database
### Aliases: db.existsObject
### Keywords: database utility

### ** Examples

## Not run: 
##D 
##D 
##D ## set up the database connection
##D ## Assume that .port is port number and .dbname is the database name
##D cid <- db.connect(port = .port, dbname = .dbname, verbose = FALSE)
##D 
##D db.list()
##D 
##D db.existsObject("madlibtestdata.lin_ornstein", cid)
##D 
##D db.disconnect(cid, verbose = FALSE)
## End(Not run)



