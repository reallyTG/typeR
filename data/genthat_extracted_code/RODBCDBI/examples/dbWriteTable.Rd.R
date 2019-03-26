library(RODBCDBI)


### Name: dbWriteTable,ODBCConnection,character,data.frame-method
### Title: Write a local data frame or file to the database.
### Aliases: dbWriteTable,ODBCConnection,character,data.frame-method

### ** Examples

## Not run: 
##D library(DBI)
##D con <- dbConnect(RODBCDBI::ODBC(), dsn="test", user="sa", password="Password12!")
##D dbWriteTable(con, "mtcars", mtcars, overwrite=TRUE)
##D dbReadTable(con, "mtcars") 
##D dbDisconnect(con)
## End(Not run)



