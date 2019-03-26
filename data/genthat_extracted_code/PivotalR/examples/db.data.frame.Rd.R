library(PivotalR)


### Name: db.data.frame
### Title: Create a 'db.data.frame' object pointing to a table/view in the
###   database
### Aliases: db.data.frame
### Keywords: utility database

### ** Examples

## Not run: 
##D 
##D 
##D ## set up the database connection
##D ## Assume that .port is port number and .dbname is the database name
##D cid <- db.connect(port = .port, dbname = .dbname)
##D 
##D ## create a table using as.db.data.frame
##D delete("abalone", conn.id = cid)
##D x <- as.db.data.frame(abalone, "abalone", conn.id = cid)
##D 
##D ## create an object pointing to the table
##D y <- db.data.frame("abalone", conn.id = cid)
##D 
##D ## x and y point to the same table
##D eql(x, y) # returns TRUE
##D 
##D ## create an object pointing to a table in a schema
##D db.q("create schema myschema", conn.id = cid)
##D z <- as.db.data.frame(abalone, "myschema.abalone", conn.id = cid)
##D db.q("drop schema myschema cascade", conn.id = cid)
##D 
##D db.disconnect(cid, verbose = FALSE)
## End(Not run)



