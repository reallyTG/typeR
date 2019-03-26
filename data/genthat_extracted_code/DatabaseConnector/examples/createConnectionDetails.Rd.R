library(DatabaseConnector)


### Name: createConnectionDetails
### Title: createConnectionDetails
### Aliases: createConnectionDetails

### ** Examples

## Not run: 
##D connectionDetails <- createConnectionDetails(dbms = "postgresql",
##D                                              server = "localhost/postgres",
##D                                              user = "root",
##D                                              password = "blah",
##D                                              schema = "cdm_v4")
##D conn <- connect(connectionDetails)
##D dbGetQuery(conn, "SELECT COUNT(*) FROM person")
##D disconnect(conn)
## End(Not run)



