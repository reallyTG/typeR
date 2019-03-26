library(PivotalR)


### Name: db.search.path
### Title: Display or set the search path (i.e. default schemas) for a
###   connected session to a database. The use can easily switch to a
###   schema that he has the privilege to write.
### Aliases: db.search.path db.default.schemas
### Keywords: utility database

### ** Examples

## Not run: 
##D 
##D 
##D ## set up the database connection
##D ## Assume that .port is port number and .dbname is the database name
##D cid <- db.connect(port = .port, dbname = .dbname, verbose = FALSE, default.schemas =
##D "public,madlib")
##D 
##D db.search.path()
##D 
##D db.search.path(set = "public,madlibtestdata")
##D 
##D db.disconnect(cid, verbose = FALSE)
## End(Not run)



