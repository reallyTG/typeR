library(sofa)


### Name: db_replicate
### Title: Upload (replicate) a local database to a remote database server,
###   e.g., Cloudant, Iriscouch
### Aliases: db_replicate

### ** Examples

## Not run: 
##D ## create a connection
##D (x <- Cushion$new())
##D 
##D # Create a database locally
##D db_list(x)
##D if ("hello_earth" %in% db_list(x)) {
##D   invisible(db_delete(x, dbname="hello_earth"))
##D }
##D db_create(x, 'hello_earth')
##D 
##D ## replicate to a remote server
##D z <- Cushion$new(host = "ropensci.cloudant.com", transport = 'https',
##D   port = NULL, user = 'ropensci', pwd = Sys.getenv('CLOUDANT_PWD'))
##D 
##D ## do the replication
##D db_replicate(x, z, dbname = "hello_earth")
##D 
##D ## check changes on the remote
##D db_list(z)
##D db_changes(z, dbname = "hello_earth")
##D 
##D ## make some changes on the remote
##D doc_create(z, dbname = "hello_earth",
##D   '{"language":"python","library":"requests"}', 'stuff')
##D changes(z, dbname = "hello_earth")
##D 
##D ## create another document, and try to get it
##D doc_create(z, dbname = "hello_earth", doc = '{"language":"R"}',
##D   docid="R_rules")
##D doc_get(z, dbname = "hello_earth", docid='R_rules')
##D 
##D ## cleanup - delete the database
##D db_delete(z, 'hello_earth')
## End(Not run)



