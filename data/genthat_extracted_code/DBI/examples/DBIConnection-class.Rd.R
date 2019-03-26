library(DBI)


### Name: DBIConnection-class
### Title: DBIConnection class
### Aliases: DBIConnection-class

### ** Examples

con <- dbConnect(RSQLite::SQLite(), ":memory:")
con
dbDisconnect(con)

## Not run: 
##D con <- dbConnect(RPostgreSQL::PostgreSQL(), "username", "passsword")
##D con
##D dbDisconnect(con)
## End(Not run)



