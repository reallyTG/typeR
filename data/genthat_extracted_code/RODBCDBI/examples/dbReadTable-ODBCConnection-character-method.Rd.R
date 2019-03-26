library(RODBCDBI)


### Name: dbReadTable,ODBCConnection,character-method
### Title: Convenience functions for importing/exporting DBMS tables
### Aliases: dbReadTable,ODBCConnection,character-method

### ** Examples

## Not run: 
##D library(DBI)
##D con <- dbConnect(RODBCDBI::ODBC(), dsn="test", user="sa", password="Password12!")
##D dbWriteTable(con, "mtcars", mtcars, overwrite=TRUE)
##D dbReadTable(con, "mtcars")
##D dbGetQuery(con, "SELECT * FROM mtcars WHERE cyl = 8")
##D 
##D # Supress row names
##D dbReadTable(con, "mtcars", row.names = FALSE)
##D dbGetQuery(con, "SELECT * FROM mtcars WHERE cyl = 8", row.names = FALSE)
##D 
##D dbDisconnect(con)
## End(Not run)



