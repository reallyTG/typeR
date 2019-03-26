library(PivotalR)


### Name: Extract database connection info
### Title: Utilities for extracting related information about a database
###   connection
### Aliases: 'connection info' user host dbname dbms conn port madlib
###   madlib.version schema.madlib conn.pkg
### Keywords: utility database

### ** Examples

## Not run: 
##D 
##D 
##D ## set up the database connection
##D ## Assume that .port is port number and .dbname is the database name
##D cid1 <- db.connect(port = .port, dbname = .dbname, verbose = FALSE)
##D cid2 <- db.connect(port = .port, dbname = .dbname, verbose = FALSE)
##D 
##D user(cid1)
##D host(cid2)
##D dbname(cid1) # use default connection 1
##D dbms(cid1)
##D madlib(cid1)
##D madlib.version(cid1)
##D schema.madlib(cid1)
##D conn.pkg(cid1)
##D 
##D ## conn is mostly for other packages
##D con <- conn(cid1) # get the connection object
##D dbListTables(con) # directly use functions in package RPostgreSQL
##D 
##D ## This package provides a better function to list all tables/views
##D db.objects(cid1) # list all tables/views with their schema in connection 1
##D 
##D db.disconnect(cid1, verbose = FALSE)
##D db.disconnect(cid2, verbose = FALSE)
## End(Not run)



