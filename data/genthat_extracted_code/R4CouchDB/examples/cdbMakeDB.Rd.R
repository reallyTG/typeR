library(R4CouchDB)


### Name: cdbMakeDB
### Title: Creates a new database
### Aliases: cdbMakeDB
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



