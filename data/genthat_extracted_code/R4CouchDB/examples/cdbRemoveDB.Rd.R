library(R4CouchDB)


### Name: cdbRemoveDB
### Title: Function to remove a database
### Aliases: cdbRemoveDB
### Keywords: misc

### ** Examples

## Not run: 
##D ccc               <- cdbIni()
##D ccc$newDBName     <- "r4couchdb_db"
##D ccc               <- cdbMakeDB(ccc)
##D ccc$res
##D ccc$removeDBName  <- ccc$DBName
##D cdbRemoveDB(ccc)$res
## End(Not run)



