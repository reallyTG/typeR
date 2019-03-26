library(odbc)


### Name: odbc-tables
### Title: Convenience functions for reading/writing DBMS tables
### Aliases: odbc-tables
###   dbWriteTable,OdbcConnection,character,data.frame-method
###   sqlData,OdbcConnection-method sqlCreateTable,OdbcConnection-method

### ** Examples

## Not run: 
##D library(DBI)
##D con <- dbConnect(odbc::odbc())
##D dbListTables(con)
##D dbWriteTable(con, "mtcars", mtcars, temporary = TRUE)
##D dbReadTable(con, "mtcars")
##D 
##D dbListTables(con)
##D dbExistsTable(con, "mtcars")
##D 
##D # A zero row data frame just creates a table definition.
##D dbWriteTable(con, "mtcars2", mtcars[0, ], temporary = TRUE)
##D dbReadTable(con, "mtcars2")
##D 
##D dbDisconnect(con)
## End(Not run)



