library(DatabaseConnector)


### Name: renderTranslateQuerySql
### Title: Render, translate, and query to data.frame
### Aliases: renderTranslateQuerySql

### ** Examples

## Not run: 
##D connectionDetails <- createConnectionDetails(dbms = "postgresql",
##D                                              server = "localhost",
##D                                              user = "root",
##D                                              password = "blah",
##D                                              schema = "cdm_v4")
##D conn <- connect(connectionDetails)
##D persons <- renderTranslatequerySql(conn, 
##D                                    sql = "SELECT TOP 10 * FROM @schema.person",
##D                                    schema = "cdm_synpuf")
##D disconnect(conn)
## End(Not run)



