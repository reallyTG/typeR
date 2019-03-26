library(RPostgres)


### Name: postgres-tables
### Title: Convenience functions for reading/writing DBMS tables
### Aliases: postgres-tables
###   dbWriteTable,PqConnection,character,data.frame-method
###   sqlData,PqConnection-method dbAppendTable,DBIConnection-method
###   dbReadTable,PqConnection,character-method
###   dbListTables,PqConnection-method
###   dbExistsTable,PqConnection,character-method
###   dbExistsTable,PqConnection,Id-method
###   dbRemoveTable,PqConnection,character-method
###   dbListFields,PqConnection,character-method
###   dbListFields,PqConnection,Id-method dbListObjects,PqConnection-method

### ** Examples

# For running the examples on systems without PostgreSQL connection:
run <- postgresHasDefault()

library(DBI)
if (run) con <- dbConnect(RPostgres::Postgres())
if (run) dbListTables(con)
if (run) dbWriteTable(con, "mtcars", mtcars, temporary = TRUE)
if (run) dbReadTable(con, "mtcars")

if (run) dbListTables(con)
if (run) dbExistsTable(con, "mtcars")

# A zero row data frame just creates a table definition.
if (run) dbWriteTable(con, "mtcars2", mtcars[0, ], temporary = TRUE)
if (run) dbReadTable(con, "mtcars2")

if (run) dbDisconnect(con)



