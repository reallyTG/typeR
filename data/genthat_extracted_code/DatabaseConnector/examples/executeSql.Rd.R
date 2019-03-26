library(DatabaseConnector)


### Name: executeSql
### Title: Execute SQL code
### Aliases: executeSql

### ** Examples

## Not run: 
##D connectionDetails <- createConnectionDetails(dbms = "postgresql",
##D                                              server = "localhost",
##D                                              user = "root",
##D                                              password = "blah",
##D                                              schema = "cdm_v4")
##D conn <- connect(connectionDetails)
##D executeSql(conn, "CREATE TABLE x (k INT); CREATE TABLE y (k INT);")
##D disconnect(conn)
## End(Not run)



