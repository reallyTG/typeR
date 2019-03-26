library(DBI)


### Name: dbCanConnect
### Title: Check if a connection to a DBMS can be established
### Aliases: dbCanConnect

### ** Examples

# SQLite only needs a path to the database. (Here, ":memory:" is a special
# path that creates an in-memory database.) Other database drivers
# will require more details (like user, password, host, port, etc.)
dbCanConnect(RSQLite::SQLite(), ":memory:")



