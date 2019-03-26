library(RMariaDB)


### Name: mariadb-tables
### Title: Read and write MariaDB tables.
### Aliases: mariadb-tables dbReadTable,MariaDBConnection,character-method
###   dbWriteTable,MariaDBConnection,character,data.frame-method
###   dbWriteTable,MariaDBConnection,character,character-method
###   dbListTables,MariaDBConnection-method
###   dbListObjects,MariaDBConnection-method
###   dbExistsTable,MariaDBConnection,character-method
###   dbRemoveTable,MariaDBConnection,character-method

### ** Examples

if (mariadbHasDefault()) {
con <- dbConnect(RMariaDB::MariaDB(), dbname = "test")

# By default, row names are written in a column to row_names, and
# automatically read back into the row.names()
dbWriteTable(con, "mtcars", mtcars[1:5, ], temporary = TRUE)
dbReadTable(con, "mtcars")
dbReadTable(con, "mtcars", row.names = FALSE)
}



