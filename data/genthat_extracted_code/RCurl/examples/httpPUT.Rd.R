library(RCurl)


### Name: httpPUT
### Title: Simple high-level functions for HTTP PUT and DELETE
### Aliases: httpPUT httpPOST httpGET httpDELETE httpHEAD httpOPTIONS
### Keywords: programming

### ** Examples

## Not run: 
##D    # create a database in a CouchDB server
##D  httpPUT("http://127.0.0.1:5984/temp_db")
##D 
##D    # Insert an entry into an ElasticSearch dabtabase.
##D  httpPUT("http://localhost:9200/a/b/axyz", '{"abc" : 123}')
##D 
##D    # Then delete the database
##D  httpDELETE("http://127.0.0.1:5984/temp_db")
## End(Not run)



