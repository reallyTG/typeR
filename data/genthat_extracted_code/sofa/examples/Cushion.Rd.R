library(sofa)


### Name: Cushion
### Title: sofa connection client
### Aliases: Cushion
### Keywords: datasets

### ** Examples

## Not run: 
##D # Create a CouchDB connection client
##D (x <- Cushion$new())
##D 
##D ## metadata
##D x$host
##D x$path
##D x$port
##D x$type
##D 
##D ## ping the CouchDB server
##D x$ping()
##D 
##D ## CouchDB server statistics
##D # stats(x)
##D 
##D # create database
##D db_create(x, "stuff")
##D 
##D # add documents to a database
##D db_create(x, "sofadb")
##D doc1 <- '{"name": "drink", "beer": "IPA", "score": 5}'
##D doc_create(x, dbname="sofadb", docid="abeer", doc1)
##D 
##D # bulk create
##D db_create(x, "mymtcars")
##D bulk_create(x, dbname="mymtcars", doc = mtcars)
##D db_list(x)
##D 
##D ## database info
##D db_info(x, "bulktest")
##D 
##D ## list dbs
##D db_list(x)
##D 
##D ## all docs
##D alldocs(x, "bulktest", limit = 3)
##D 
##D ## changes
##D changes(x, "bulktest")
##D 
##D # With auth
##D x <- Cushion$new(user = 'sckott', pwd = 'sckott')
##D 
##D # Using Cloudant
##D z <- Cushion$new(host = "ropensci.cloudant.com", transport = 'https', port = NULL,
##D    user = 'ropensci', pwd = Sys.getenv('CLOUDANT_PWD'))
##D z
##D db_list(z)
##D db_create(z, "stuff2")
##D db_info(z, "stuff2")
##D alldocs(z, "foobar")
## End(Not run)



