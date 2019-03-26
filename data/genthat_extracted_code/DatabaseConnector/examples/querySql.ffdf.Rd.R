library(DatabaseConnector)


### Name: querySql.ffdf
### Title: Retrieves data to an ffdf object
### Aliases: querySql.ffdf

### ** Examples

## Not run: 
##D library(ffbase)
##D connectionDetails <- createConnectionDetails(dbms = "postgresql",
##D                                              server = "localhost",
##D                                              user = "root",
##D                                              password = "blah",
##D                                              schema = "cdm_v4")
##D conn <- connect(connectionDetails)
##D count <- querySql.ffdf(conn, "SELECT COUNT(*) FROM person")
##D disconnect(conn)
## End(Not run)



