library(nodbi)


### Name: docdb_get
### Title: Get documents
### Aliases: docdb_get

### ** Examples

## Not run: 
##D # CouchDB
##D src <- src_couchdb()
##D docout <- docdb_create(src, key = "mtcars2", value = mtcars)
##D docdb_get(src, "mtcars2")
##D 
##D # etcd
##D # src <- src_etcd()
##D # docdb_create(src, "/hello", mtcars)
##D # docdb_get(src, "/hello")
##D 
##D # Elasticsearch
##D src <- src_elastic()
##D docdb_create(src, "iris", iris)
##D docdb_get(src, "iris")
##D 
##D # Redis
##D src <- src_redis()
##D docdb_create(src, "mtcars", mtcars)
##D docdb_get(src, "mtcars")
##D 
##D # Mongo
##D src <- src_mongo()
##D docdb_create(src, "mtcars", mtcars)
##D docdb_get(src, "mtcars")
## End(Not run)



