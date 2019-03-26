library(R4CouchDB)


### Name: cdbUpdateDoc
### Title: This function updates an existing doc
### Aliases: cdbUpdateDoc
### Keywords: misc

### ** Examples

## Not run: 
##D ccc               <- cdbIni()
##D # I assume a database at localhost:5984 already exists
##D ccc$DBName        <- "r4couchdb_db"
##D ccc$dataList      <- list(normalDistRand =  rnorm(20))
##D ccc               <- cdbAddDoc(ccc)
##D 
##D ccc$dataList$Date <- date()
##D ccc               <- cdbUpdateDoc(ccc)
## End(Not run)



