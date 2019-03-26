library(PivotalR)


### Name: db.q
### Title: Execute a SQL query
### Aliases: db .db db.q
### Keywords: utility database

### ** Examples

## Not run: 
##D 
##D 
##D ## set up the database connection
##D ## Assume that .port is port number and .dbname is the database name
##D cid <- db.connect(port = .port, dbname = .dbname, verbose = FALSE)
##D 
##D db("show search_path", conn.id = cid)
##D .db("drop table if exists tr;",
##D     "create temp table tr (idx integer,
##D                            val double precision);",
##D     "insert into tr values (1, 2.3), (2, 3.4)", conn.id = cid)
##D db.q("select * from tr", conn.id = cid)
##D 
##D db.disconnect(cid, verbose = FALSE)
## End(Not run)



