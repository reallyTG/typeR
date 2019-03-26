library(DatabaseConnector)


### Name: dbConnect,DatabaseConnectorDriver-method
### Title: Create a connection to a DBMS
### Aliases: dbConnect,DatabaseConnectorDriver-method

### ** Examples

## Not run: 
##D conn <- dbConnect(DatabaseConnectorDriver(),
##D                   dbms = "postgresql",
##D                   server = "localhost/ohdsi",
##D                   user = "joe",
##D                   password = "secret")
##D querySql(conn, "SELECT * FROM cdm_synpuf.person")
##D dbDisconnet(conn)
## End(Not run)




