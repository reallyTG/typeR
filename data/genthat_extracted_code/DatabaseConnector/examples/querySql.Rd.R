library(DatabaseConnector)


### Name: querySql
### Title: Retrieve data to a data.frame
### Aliases: querySql

### ** Examples

## Not run: 
##D connectionDetails <- createConnectionDetails(dbms = "postgresql",
##D                                              server = "localhost",
##D                                              user = "root",
##D                                              password = "blah",
##D                                              schema = "cdm_v4")
##D conn <- connect(connectionDetails)
##D count <- querySql(conn, "SELECT COUNT(*) FROM person")
##D disconnect(conn)
## End(Not run)



