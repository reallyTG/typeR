library(DBI)


### Name: dbConnect
### Title: Create a connection to a DBMS
### Aliases: dbConnect

### ** Examples

# SQLite only needs a path to the database. (Here, ":memory:" is a special
# path that creates an in-memory database.) Other database drivers
# will require more details (like user, password, host, port, etc.)
con <- dbConnect(RSQLite::SQLite(), ":memory:")
con

dbListTables(con)

dbDisconnect(con)



