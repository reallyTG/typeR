library(DatabaseConnector)


### Name: renderTranslateExecuteSql
### Title: Render, translate, execute SQL code
### Aliases: renderTranslateExecuteSql

### ** Examples

## Not run: 
##D connectionDetails <- createConnectionDetails(dbms = "postgresql",
##D                                              server = "localhost",
##D                                              user = "root",
##D                                              password = "blah",
##D                                              schema = "cdm_v4")
##D conn <- connect(connectionDetails)
##D renderTranslateExecuteSql(connection, 
##D                           sql = "SELECT * INTO #temp FROM @schema.person;",
##D                           schema = "cdm_synpuf")
##D disconnect(conn)
## End(Not run)



