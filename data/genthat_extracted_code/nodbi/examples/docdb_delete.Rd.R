library(nodbi)


### Name: docdb_delete
### Title: Delete documents
### Aliases: docdb_delete

### ** Examples

## Not run: 
##D # couchdb
##D (src <- src_couchdb())
##D docdb_create(src, "mtcars", mtcars)
##D docdb_get(src, "mtcars")
##D docdb_delete(src, "mtcars")
##D 
##D # etcd
##D # src <- src_etcd()
##D # docdb_create(src, "/iris", iris)
##D # docdb_get(src, "/iris")
##D # docdb_delete(src, "/iris")
##D 
##D # elasticsearch
##D src <- src_elastic()
##D docdb_create(src, "iris", iris)
##D docdb_get(src, "iris")
##D docdb_delete(src, "iris")
##D 
##D # Redis
##D src <- src_redis()
##D docdb_create(src, key = "mtcars", value = mtcars)
##D docdb_get(src, "mtcars")
##D docdb_delete(src, "mtcars")
##D 
##D # mongo
##D src <- src_mongo("stuff")
##D docdb_create(src, "iris", iris)
##D docdb_get(src, "iris")
##D docdb_delete(src)
## End(Not run)



