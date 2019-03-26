library(RMySQL)


### Name: dbEscapeStrings
### Title: Escape SQL-special characters in strings.
### Aliases: dbEscapeStrings
###   dbEscapeStrings,MySQLConnection,character-method
###   dbEscapeStrings,MySQLResult,character-method

### ** Examples

if (mysqlHasDefault()) {
con <- dbConnect(RMySQL::MySQL(), dbname = "test")

tmp <- sprintf("SELECT * FROM emp WHERE lname = %s", "O'Reilly")
dbEscapeStrings(con, tmp)

dbDisconnect(con)
}



