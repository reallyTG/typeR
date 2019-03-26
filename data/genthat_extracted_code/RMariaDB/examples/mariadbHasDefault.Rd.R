library(RMariaDB)


### Name: mariadbHasDefault
### Title: Check if default database is available.
### Aliases: mariadbHasDefault mariadbDefault

### ** Examples

if (mariadbHasDefault()) {
  db <- dbConnect(RMariaDB::MariaDB(), dbname = "test")
  dbListTables(db)
  dbDisconnect(db)
}



