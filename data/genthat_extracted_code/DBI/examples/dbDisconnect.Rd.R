library(DBI)


### Name: dbDisconnect
### Title: Disconnect (close) a connection
### Aliases: dbDisconnect

### ** Examples

con <- dbConnect(RSQLite::SQLite(), ":memory:")
dbDisconnect(con)



