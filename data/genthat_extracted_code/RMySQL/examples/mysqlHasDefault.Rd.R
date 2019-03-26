library(RMySQL)


### Name: mysqlHasDefault
### Title: Check if default database is available.
### Aliases: mysqlHasDefault

### ** Examples

if (mysqlHasDefault()) {
  db <- dbConnect(RMySQL::MySQL(), dbname = "test")
  dbListTables(db)
  dbDisconnect(db)
}



