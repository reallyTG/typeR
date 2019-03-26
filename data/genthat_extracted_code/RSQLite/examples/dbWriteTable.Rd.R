library(RSQLite)


### Name: dbWriteTable,SQLiteConnection,character,data.frame-method
### Title: Write a local data frame or file to the database
### Aliases: dbWriteTable,SQLiteConnection,character,data.frame-method
###   dbWriteTable,SQLiteConnection,character,character-method

### ** Examples

con <- dbConnect(SQLite())
dbWriteTable(con, "mtcars", mtcars)
dbReadTable(con, "mtcars")

# A zero row data frame just creates a table definition.
dbWriteTable(con, "mtcars2", mtcars[0, ])
dbReadTable(con, "mtcars2")

dbDisconnect(con)



