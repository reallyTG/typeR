library(nodbi)


### Name: docdb_create
### Title: Create documents
### Aliases: docdb_create

### ** Examples

## Not run: 
##D # CouchDB
##D src <- src_couchdb()
##D docdb_create(src, key="mtcars2", value=mtcars)
##D docdb_get(src, "mtcars2")
##D 
##D # etcd
##D # src <- src_etcd()
##D # docdb_create(src, key = "/newmtcars7", value = mtcars)
##D # docdb_get(src, "/newmtcars7")
##D 
##D # Elasticsearch
##D src <- src_elastic()
##D docdb_create(src, key = "mtcars", value = mtcars)
##D docdb_create(src, key = "iris", value = iris)
##D docdb_create(src, key = "diamonds_small", value = diamonds[1:3000L,])
##D 
##D # Redis
##D src <- src_redis()
##D docdb_create(src, key = "mtcars", value = mtcars)
##D docdb_get(src, "mtcars")
##D docdb_delete(src, "mtcars")
##D 
##D # MongoDB
##D src <- src_mongo()
##D docdb_create(src, key = "mtcars", value = mtcars)
##D docdb_get(src, "mtcars")
## End(Not run)



