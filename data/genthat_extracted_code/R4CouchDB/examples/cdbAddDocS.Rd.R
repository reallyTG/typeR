library(R4CouchDB)


### Name: cdbAddDocS
### Title: This function adds multiple database documents with one request
### Aliases: cdbAddDocS
### Keywords: misc

### ** Examples

## Not run: 
##D ccc               <- cdbIni()
##D # I assume a database at localhost:5984 already exists
##D ccc$DBName        <- "r4couchdb_db"
##D docs <- list()
##D for(i in 1:10){
##D  docs[[i]] <- list(normalDistRand =  rnorm(20))
##D }
##D # docs is noe a list of 10 lists
##D ccc$dataList <- docs
##D # generating 10 database documents
##D cccAddDocS(ccc)$res
## End(Not run)



