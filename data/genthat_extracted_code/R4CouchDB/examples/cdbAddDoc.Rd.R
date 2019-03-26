library(R4CouchDB)


### Name: cdbAddDoc
### Title: Generates a new document
### Aliases: cdbAddDoc
### Keywords: misc

### ** Examples

## Not run: 
##D ccc               <- cdbIni()
##D # I assume a database at localhost:5984 already exists
##D ccc$DBName        <- "r4couchdb_db"
##D ccc$dataList      <- list(normalDistRand =  rnorm(20))
##D ccc               <- cdbAddDoc(ccc)
##D 
## End(Not run)



