library(RPostgres)


### Name: postgresHasDefault
### Title: Check if default database is available.
### Aliases: postgresHasDefault postgresDefault

### ** Examples

if (postgresHasDefault()) {
  db <- postgresDefault()
  dbListTables(db)
  dbDisconnect(db)
}



