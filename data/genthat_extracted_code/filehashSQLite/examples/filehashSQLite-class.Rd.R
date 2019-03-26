library(filehashSQLite)


### Name: filehashSQLite-class
### Title: Class "filehashSQLite"
### Aliases: filehashSQLite-class dbDelete,filehashSQLite,character-method
###   dbExists,filehashSQLite,character-method
###   dbFetch,filehashSQLite,character-method
###   dbInsert,filehashSQLite,character-method dbList,filehashSQLite-method
###   dbUnlink,filehashSQLite-method
###   dbMultiFetch,filehashSQLite,character-method
###   dbDisconnect,filehashSQLite-method
###   [,filehashSQLite,character,ANY,ANY-method
### Keywords: classes

### ** Examples

library(filehashSQLite)

dbCreate("myTestDB", type = "SQLite")
db <- dbInit("myTestDB", type = "SQLite")

set.seed(100)
db$a <- rnorm(100)
db$b <- "a character element"

with(db, mean(a))

cat(db$b, "\n")



