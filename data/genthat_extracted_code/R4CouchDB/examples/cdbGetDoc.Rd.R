library(R4CouchDB)


### Name: cdbGetDoc
### Title: Get a doc from CouchDB
### Aliases: cdbGetDoc
### Keywords: misc

### ** Examples

## Not run: 
##D ccc               <- cdbIni()
##D ccc$newDBName     <- "r4couchdb_db"
##D ccc$dataList      <- list(normalDistRand =  rnorm(20))
##D ccc               <- cdbAddDoc(ccc)
##D cdbGetDoc(ccc)$res
## End(Not run)



