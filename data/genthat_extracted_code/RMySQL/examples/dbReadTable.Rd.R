library(RMySQL)


### Name: dbReadTable,MySQLConnection,character-method
### Title: Convenience functions for importing/exporting DBMS tables
### Aliases: dbExistsTable,MySQLConnection,character-method
###   dbListFields,MySQLConnection,character-method
###   dbListTables,MySQLConnection-method
###   dbReadTable,MySQLConnection,character-method
###   dbRemoveTable,MySQLConnection,character-method

### ** Examples

if (mysqlHasDefault()) {
con <- dbConnect(RMySQL::MySQL(), dbname = "test")

# By default, row names are written in a column to row_names, and
# automatically read back into the row.names()
dbWriteTable(con, "mtcars", mtcars[1:5, ], overwrite = TRUE)
dbReadTable(con, "mtcars")
dbReadTable(con, "mtcars", row.names = NULL)
}



