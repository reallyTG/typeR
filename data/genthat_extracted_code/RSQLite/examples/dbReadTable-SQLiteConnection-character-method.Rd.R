library(RSQLite)


### Name: dbReadTable,SQLiteConnection,character-method
### Title: Read a database table
### Aliases: dbReadTable,SQLiteConnection,character-method

### ** Examples

library(DBI)
db <- RSQLite::datasetsDb()
dbReadTable(db, "mtcars")
dbReadTable(db, "mtcars", row.names = FALSE)
dbDisconnect(db)



