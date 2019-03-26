library(RPostgreSQL)


### Name: dbReadTable-methods
### Title: Convenience functions for Importing/Exporting DBMS tables
### Aliases: dbReadTable-methods dbWriteTable-methods dbExistsTable-methods
###   dbRemoveTable-methods
###   dbReadTable,PostgreSQLConnection,character-method
###   dbWriteTable,PostgreSQLConnection,character,character-method
###   dbWriteTable,PostgreSQLConnection,character,data.frame-method
###   dbExistsTable,PostgreSQLConnection,character-method
###   dbRemoveTable,PostgreSQLConnection,character-method
### Keywords: methods interface database

### ** Examples
## Not run: 
##D conn <- dbConnect("PostgreSQL", dbname = "wireless")
##D if(dbExistsTable(con, "frame_fuel")){
##D    dbRemoveTable(conn, "frame_fuel")
##D    dbWriteTable(conn, "frame_fuel", fuel.frame)
##D }
##D if(dbExistsTable(conn, "RESULTS")){
##D    dbWriteTable(conn, "RESULTS", results2000, append = T)
##D else
##D    dbWriteTable(conn, "RESULTS", results2000)
##D }
## End(Not run)



