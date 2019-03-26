library(DatabaseConnector)


### Name: renderTranslateQuerySql.ffdf
### Title: Render, translate, and query to ffdf
### Aliases: renderTranslateQuerySql.ffdf

### ** Examples

## Not run: 
##D connectionDetails <- createConnectionDetails(dbms = "postgresql",
##D                                              server = "localhost",
##D                                              user = "root",
##D                                              password = "blah",
##D                                              schema = "cdm_v4")
##D conn <- connect(connectionDetails)
##D persons <- renderTranslatequerySql.ffdf(conn, 
##D                                         sql = "SELECT * FROM @schema.person",
##D                                         schema = "cdm_synpuf")
##D disconnect(conn)
## End(Not run)



