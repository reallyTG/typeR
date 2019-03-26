library(ibmdbR)


### Name: idadf,idaSave,idaUpdate
### Title: Query, store and update data in the database.
### Aliases: idadf idaSave idaUpdate

### ** Examples

## Not run: 
##D # create connection to DB
##D con <- idaConnect("BLUDB", "", "")
##D 
##D # create data.frame from table
##D df <- idadf(con, "SELECT * FROM IRIS")
##D 
##D # close the connection again
##D idaClose(con)
## End(Not run)



