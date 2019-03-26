library(ibmdbR)


### Name: idaDeleteTable, idaExistTable, idaGetValidTableName, idaIsView
### Title: Miscellaneous tools
### Aliases: idaDeleteTable idaExistTable idaGetValidTableName idaIsView
###   idaAppend

### ** Examples

## Not run: 
##D 
##D #Check whether a table with a given name exists
##D idaExistTable('IRIS')
##D 
##D #Create a pointer to the table
##D idf <- ida.data.frame('IRIS')
##D 
##D #Obtain a unique table name for a copy
##D copyTableName <- idaGetValidTableName(prefix = "COPY_")
##D 
##D #Create a copy of the original table
##D idfCopy <- as.ida.data.frame(as.data.frame(idf),copyTableName)
##D 
##D #Delete the copy again
##D idaDeleteTable(copyTableName)
##D 
## End(Not run)



