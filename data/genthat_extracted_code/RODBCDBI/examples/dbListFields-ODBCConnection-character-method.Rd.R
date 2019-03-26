library(RODBCDBI)


### Name: dbListFields,ODBCConnection,character-method
### Title: List fields in specified table.
### Aliases: dbListFields,ODBCConnection,character-method

### ** Examples

## Not run: 
##D library(DBI)
##D con <- dbConnect(RODBCDBI::ODBC(), dsn="test", user="sa", password="Password12!")
##D dbWriteTable(con, "iris", iris, overwrite=TRUE)
##D dbListFields(con, "iris")
##D dbDisconnect(con)
## End(Not run)



