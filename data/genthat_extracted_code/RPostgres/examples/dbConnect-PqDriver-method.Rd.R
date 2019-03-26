library(RPostgres)


### Name: dbConnect,PqDriver-method
### Title: Connect to a PostgreSQL database.
### Aliases: dbConnect,PqDriver-method dbDisconnect,PqConnection-method

### ** Examples

if (postgresHasDefault()) {
library(DBI)
# Pass more arguments as necessary to dbConnect()
con <- dbConnect(RPostgres::Postgres())
dbDisconnect(con)
}



